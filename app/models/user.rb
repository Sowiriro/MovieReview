class User < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true,
    format: { 
      with: /\A[A-Za-z][A-Za-z0-9]*\z/, 
      allow_blank: true,
      message: :invalid_member_name
       },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: {case_sensitive: false}

  validates :full_name, presence: true, length: {maximum: 20}

  def votable_for?(review)
    review && review.user != self && !likes.exists?(review_id: review.id)
  end
end
