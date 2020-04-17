class Review < ApplicationRecord

    belongs_to :movie 
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :likers, through: :likes, source: :user

    validates :body, length: {maximum: 2000}
end
