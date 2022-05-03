class AddTitleToMesses < ActiveRecord::Migration[6.1]
  def change
    add_column :messes,:title,:string
  end
end
