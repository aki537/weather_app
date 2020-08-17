class Area < ApplicationRecord
validates :prefecture, presence: true

has_many :user
end
