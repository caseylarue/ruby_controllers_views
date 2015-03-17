class Product < ActiveRecord::Base
	validates :name, :description, :price, presence: true
	validates :name, :description, length: { in: 2..85 }
	validates :name, uniqueness: { case_sensitive: false }
end
