# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :bigint           not null
#  user_id     :bigint
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board
  
  has_many :comments, dependent: :destroy

end
