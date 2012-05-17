class AddIndexBooks < ActiveRecord::Migration
  def up
    add_index :books, :deleted_at
  end

  def down
    remove_index :books, :deleted_at
  end
end
