class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :phone
      t.string :gender
      t.string :city
      t.string :state
      t.string :address
      t.string :pincode

      t.timestamps
    end
  end
end
