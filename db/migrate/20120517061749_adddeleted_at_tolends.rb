class AdddeletedAtTolends < ActiveRecord::Migration
  def up
    add_column :lends, :deleted_at, :timestamp
  end

  def down
    remove_column :lends, :deleted_at
  end
end
