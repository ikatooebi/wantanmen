class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :prefecture

      t.timestamps
    end

    add_index :addresses, [:user_id, :prefecture]
  end
end
