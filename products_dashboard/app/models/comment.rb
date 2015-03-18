class Comment < ActiveRecord::Base
  belongs_to :product, :dependent => :destroy
  validates  :comment, presence: true, length: { minimum: 5 }
end
