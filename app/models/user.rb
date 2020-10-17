class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites,  dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries,  dependent: :destroy
  has_many :schedules, dependent: :destroy

  attachment :avator_image

  def self.create_all_ranks 
    # Event.find(Favorite.group(:event_id).order('count(event_id) desc').limit(3).pluck(:event_id))
    Event.find(Favorite.group(:event_id).order(Arel.sql("LOWER(event_id) desc")).limit(3).pluck(:event_id))
  end
end
