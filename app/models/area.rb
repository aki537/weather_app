class Area < ApplicationRecord
validates :prefecture, presence: true

has_many :user
has_many :comments, dependent: :destroy
end
