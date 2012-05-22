class CreateTwis < ActiveRecord::Migration
  def change
    create_table :twis do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
