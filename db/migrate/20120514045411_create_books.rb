class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.string :isbn, null: false

      t.timestamps
    end
  end
end
