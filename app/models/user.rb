class User <  ActiveRecord::Base
	has_many :posts

	validates :email, :first_name, :password, presence: true
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Not valid!" 
	
end