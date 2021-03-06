class Product < ActiveRecord::Base
	belongs_to :category
	has_many :comments, :dependent => :destroy
	validates :name, :description, :price, presence: true
	validates :name, :description, length: { in: 2..85 }
	validates :name, uniqueness: { case_sensitive: false }
end
