class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :email, presence: true, length: { in: 2..20 }
	validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end