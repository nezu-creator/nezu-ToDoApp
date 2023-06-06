class Board < ApplicationRecord
  
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

end
