class CreateRandomdbs < ActiveRecord::Migration[6.1]
  def change
    create_table :randomdbs do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.string :mtype

      t.timestamps
    end
  end
end
