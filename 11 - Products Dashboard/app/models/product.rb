class Product < ActiveRecord::Base
	belongs_to :category
	validates :name, :description, :pricing, :presence => true
	validates :name, :description, :length => { :minimum => 2 }
end
