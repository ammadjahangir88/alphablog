class Article < ApplicationRecord
   belongs_to :user
   has_one_attached :image
<<<<<<< HEAD
   has_many :comments
=======
   has_many :comments , dependent: :destroy
   has_many :polycomments, as: :commentable
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
   validates :title, presence: true, length: {minimum: 3 , maximum: 50}
   validates :description, presence: true, length: {minimum:5 , maximum: 300}
   validates :user_id, presence:true
   def image_as_thumbnail

      image.variant(resize_to_limit: [300,300]).processed
   end
end