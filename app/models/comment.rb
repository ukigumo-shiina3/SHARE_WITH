class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :comment,  length: { in: 2..500 }, presence: true
end
