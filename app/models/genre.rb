class Genre < ApplicationRecord
    has_many :comments, dependent: :destroy
end
