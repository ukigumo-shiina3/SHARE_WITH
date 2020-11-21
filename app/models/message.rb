class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, length: { in: 2..500 } ,presence: true
end
