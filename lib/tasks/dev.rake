# -*- encoding : utf-8 -*-
require 'lorem_helper'
namespace :dev do

  include LoremHelper

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed" ]
  
  desc "Rebuild system"
  task :rebuild => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed" ]
  

  desc "insert many course_topics"
  task :insert_many_course_topics => :environment do
    ["自然", "電腦", "ruby on rails"].each do |name|
      topic = CourseTopic.create!(:name => name)
      puts topic.name
    end
  end

  desc "generate random course"
  task :generate_random_coruse => :environment do
    lorem_courses(30)
  end


def lorem_courses(total)
    #generate admin
    total.times.each do
      course = Course.new
      course.user_id = rand(3) + 1
      course.name = lorem_words(1)
      course.course_topic_id = rand(2) + 1
      course.plan = lorem_paragraphs(3)
      course.hourly_rate = rand(1000) + 50
      course.save
      puts course.id
    end
 end

end
