class Comment < ActiveRecord::Base
  belongs_to :product
  validates  :comment, presence: true, length: { minimum: 5 }
end
