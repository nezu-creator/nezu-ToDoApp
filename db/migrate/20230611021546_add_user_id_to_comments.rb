class AddUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :Comments, :user_id, :integer
  end
end
