class User <  ActiveRecord::Base
	has_many :posts

	validates :email, :first_name, :password, presence: true
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Not valid!" 
	
	scope :users_with_email, -> {where("email IS NOT NULL AND email <> ''")}

	def full_name
		(self.first_name.presence || "") + " " + (self.last_name.presence || "")
	end
	
end