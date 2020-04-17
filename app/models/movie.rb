class Movie < ApplicationRecord

    has_many :reviews
    has_many :images, class_name: "MovieImage"

    validates :title, :body, :released_at, presence: true
    validates :title, length: {maximum: 20}
    validates :body, length: {maximum: 2000}
end
