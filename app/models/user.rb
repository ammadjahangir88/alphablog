class User < ApplicationRecord
<<<<<<< HEAD
    has_many :articles
    has_many :comments
=======
    has_many :articles, dependent: :destroy
    has_many :comments , dependent: :destroy
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
    validates :username, presence: true, uniqueness: true,length: {minimum:3,maximum:32}
  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum:105}, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX}
    has_secure_password
   
end