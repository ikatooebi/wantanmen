class UseDragonflyBook < ActiveRecord::Migration
  def up
    add_column :books, :pdf_uid,  :string
    add_column :books, :pdf_name, :string
  end

  def down
    remove_column :books, :pdf_uid, :string
    remove_column :books, :pdf_name, :string
  end
end
