class CreateUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :fb_id, :string
    add_column :users, :token, :text
  end
end
