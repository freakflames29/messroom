class CreatePins < ActiveRecord::Migration[6.1]
  def change
    create_table :pins do |t|
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
