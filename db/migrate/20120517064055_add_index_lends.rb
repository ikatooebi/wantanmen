class AddIndexLends < ActiveRecord::Migration
  def up
    add_index :lends, :deleted_at
    remove_index :lends, [:book_id, :return_day]
    add_index :lends, [:user_id, :book_id, :return_day, :deleted_at], unique: :true
  end

  def down
    remove_index :lends, :deleted_at
  end
end
