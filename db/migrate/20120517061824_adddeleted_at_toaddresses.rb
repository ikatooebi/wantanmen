class AdddeletedAtToaddresses < ActiveRecord::Migration
  def up
    add_column :addresses, :deleted_at, :timestamp
  end

  def down
    remove_column :addresses, :deleted_at
  end
end
