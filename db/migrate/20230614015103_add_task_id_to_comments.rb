class AddTaskIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :task_id, :integer
  end
end
