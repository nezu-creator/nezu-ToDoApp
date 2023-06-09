# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord


  validates :name, presence: true
  validates :description, presence: true
  validates :description, uniqueness: true

  belongs_to :user

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

end
