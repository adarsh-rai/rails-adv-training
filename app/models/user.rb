class User < ActiveRecord::Base
	has_secure_password
	validates :email, :name , uniqueness: true, presence: true

	def as_json(options={})
	  { :email => self.email, name: self.name }
	end
end
