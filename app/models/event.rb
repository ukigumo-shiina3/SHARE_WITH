class Event < ApplicationRecord

    MAX_EVENTS_COUNT = 3

    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
    belongs_to :genre,optional: true
    
    attachment :image
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    def self.create_all_ranks 
        Event.find(Favorite.group(:event_id).order(Arel.sql("count(event_id) desc")).limit(3).pluck(:event_id))
    end

    validates :title, :body, :image_id, :recruitment, :event_date, :open_hour, :open_minute, :end_hour, :end_minute, presence: true
    validate :posts_count_must_be_within_limit

    def posts_count_must_be_within_limit
        errors.add(:base, "イベントの最大投稿数は#{MAX_EVENTS_COUNT}つです") if user.events.count >= MAX_EVENTS_COUNT
    end
end
