class AddNameAndDescriptionToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :description, :text
  end
end
