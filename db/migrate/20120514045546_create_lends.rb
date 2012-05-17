class CreateLends < ActiveRecord::Migration
  def change
    create_table :lends do |t|
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.date :return_day, null: true

      t.timestamps
    end
  end
end
