class Event < ApplicationRecord
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
    belongs_to :genre,optional: true
    attachment :image

    validates :title, presence: true
	validates :body, presence: true
end
