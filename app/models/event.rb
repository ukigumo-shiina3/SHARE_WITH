class Event < ApplicationRecord
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    # has_many :schedules, dependent: :destroy 将来的に追加するかも
    belongs_to :user
    belongs_to :genre,optional: true
    
    attachment :image
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    def self.create_all_ranks 
        Event.find(Favorite.group(:event_id).order(Arel.sql("LOWER(event_id) desc")).limit(3).pluck(:event_id))
    end

    validates :title, :body, :image_id, :recruitment, :event_date, :open_hour, :open_minute, :end_hour, :end_minute, presence: true
end
