class ChangeReturndayTypeandAddIndex < ActiveRecord::Migration
  def up
    change_column :lends, :return_day, :datetime
    add_index :lends, [:book_id, :return_day], unique: true
  end

  def down
    remove_index :lends, [:book_id, :return_day]
    change_column :lends, :return_day, :date
  end
end
