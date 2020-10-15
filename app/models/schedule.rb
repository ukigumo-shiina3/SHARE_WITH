class Schedule < ApplicationRecord
    belongs_to :user
    # belongs_to :event 将来的に追加するかも
end
