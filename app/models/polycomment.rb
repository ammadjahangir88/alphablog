class Polycomment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
 
end
