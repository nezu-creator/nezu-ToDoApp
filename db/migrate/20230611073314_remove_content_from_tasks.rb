class RemoveContentFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :content, :text
  end
end
