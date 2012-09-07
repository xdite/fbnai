class AddPhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.text :url
      t.timestamps
    end
    
  end
end
