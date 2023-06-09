# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#
class Comment < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :description, uniqueness: true

  belongs_to :task
end
