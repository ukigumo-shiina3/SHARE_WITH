class Event < ApplicationRecord
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
    belongs_to :genre,optional: true

    attachment :image

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    def self.create_all_ranks 
        Event.find(Favorite.group(:event_id).order('count(event_id) desc').limit(3).pluck(:event_id))
    end
end
