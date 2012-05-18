class UseDragonflyUser < ActiveRecord::Migration
  def up
    add_column :users, :cover_image_uid,  :string
    add_column :users, :cover_image_name, :string
  end

  def down
    remove_column :users, :cover_image_uid, :string
    remove_column :users, :cover_image_name, :string
  end
end
