class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :nickname
      t.string :email
      t.string :imag_url

      t.timestamps
    end
  end
end
