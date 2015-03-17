class Category < ActiveRecord::Base
	belongs_to :product
	has_many :products
end
