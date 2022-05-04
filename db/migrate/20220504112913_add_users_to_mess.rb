class AddUsersToMess < ActiveRecord::Migration[6.1]
  def change
    add_reference :messes,:user,foreign_key: true
  end
end
