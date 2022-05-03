class CreateMesses < ActiveRecord::Migration[6.1]
  def change
    create_table :messes do |t|
      t.integer :price
      t.string :city
      t.string :state
      t.string :adrs
      t.string :pincode
      t.string :landmark
      t.text :description
      t.boolean :service_boys_only,default: false
      t.boolean :service_girls_only,default: false
      t.boolean :student_boys_only,default: false
      t.boolean :student_girls_only,default: false
      t.boolean :for_all,default: false
      t.boolean :room_available,default: false

      t.timestamps
    end
  end
end
