class AddIndexAddresses < ActiveRecord::Migration
  def up
    add_index:addresses, :deleted_at
  end

  def down
    remove_index:addresses, :deleted_at
  end
end
