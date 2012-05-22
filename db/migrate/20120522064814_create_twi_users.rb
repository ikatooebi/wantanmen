class CreateTwiUsers < ActiveRecord::Migration
  def change
    create_table :twi_users do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
