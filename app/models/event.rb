class Event < ApplicationRecord
  MAX_EVENTS_COUNT = 3

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :genre, optional: true

  attachment :image
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.create_all_ranks
    Event.find(Favorite.group(:event_id).order(Arel.sql('count(event_id) desc')).limit(3).pluck(:event_id))
  end

  validates :title, length: { in: 2..30 },  presence: true
  validates :body,  length: { in: 2..500 },  presence: true
  validates :recruitment,  length: { in: 2..100 },  presence: true
  validates :event_date, :open_hour, :open_minute, :end_hour, :end_minute, presence: true

  def events_count_must_be_within_limit
      if user.events.count >= MAX_EVENTS_COUNT
        errors.add(:base, "イベントの最大投稿数は#{MAX_EVENTS_COUNT}つです")
      end
  end
end
