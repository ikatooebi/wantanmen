class AdddeletedAtTobooks < ActiveRecord::Migration
  def up
    add_column :books, :deleted_at, :timestamp
  end

  def down
    remove_column :books, :deleted_at
  end
end
