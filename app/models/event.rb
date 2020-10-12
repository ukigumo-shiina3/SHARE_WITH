class Event < ApplicationRecord
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
    belongs_to :genre,optional: true

    attachment :image

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
