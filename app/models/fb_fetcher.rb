module FBFetcher
  def get_friends(user)
    @graph = Koala::Facebook::API.new(user.token)
    friends = @graph.get_connections(user.id, "friends")
    friends.each do |friend|
      @friend = User.new
      @friend.update_attributes({
                                  :name => friend['name'],
                                  :token => user.token,
                                  :fb_id => friend['id'],
                                  :mail => ""
      })

      friend = Friend.new
      friend.update_attributes({
                                 :user_id => user.id,
                                 :friend_id => @friend.id
      })

    end
  end


  def get_links(user)
    @graph = Koala::Facebook::API.new(user.token)
    links = @graph.get_connections(user.fb_id, "links")
    links.each do |link|
      puts link
    end
  end

  def get_likes(user)

  end

  def get_photos(user)
    @graph = Koala::Facebook::API.new(user.token)
    albums = @graph.get_connections(user.fb_id, "albums")
    albums.each do |album|
      photos = @graph.get_connections("#{album['id']}", "photos")
      photos.each do |photo|

        @p = Photo.new
        @p.update_attributes({
                               :user_id => user.id,
                               :url => photo['source']
        })
      end
    end
  end

  def get_subscriber_photo(user)
    @graph = Koala::Facebook::API.new(user.token)
    girls = @graph.get_connections(user.fb_id, "subscribedto")
    girls.each do |girl|

      albums = @graph.get_connections("#{girl["id"]}", "albums")
      albums.each do |album|

        photos = @graph.get_connections("#{album['id']}", "photos")
        photos.each do |photo|

          @p = Photo.new
          @p.update_attributes({
                                 :user_id => "#{girl["id"]}",
                                 :url => photo['source']
          })

        end
      end
    end
  end

  def get_stream_photo(user)
    @graph = Koala::Facebook::API.new(user.token)
    feeds = @graph.get_connections("me", "home")
    feeds.each do |feed|
      if feed["type"] == "photo"
        @p = Photo.new
        @p.user_id = feed["from"]["id"]
        @p.url = feed["link"]
        @p.save
      end
    end
  end
end
