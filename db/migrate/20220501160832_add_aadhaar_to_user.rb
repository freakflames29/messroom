class AddAadhaarToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users ,:adh,:string,default:'000000000000'
    add_column :users,:is_owner,:boolean,default:false
    
  end
end
