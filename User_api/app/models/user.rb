class User < ActiveRecord::Base
	has_secure_password
	validates :email, :name , uniqueness: true, presence: true
end
