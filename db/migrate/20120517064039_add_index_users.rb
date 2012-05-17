class AddIndexUsers < ActiveRecord::Migration
  def up
    add_index :users, :deleted_at
  end

  def down
    remove_index :users, :deleted_at
  end
end
