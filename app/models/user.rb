class User < ActiveRecord::Base
	has_many :assignments
	has_many :courses, through: :assignments
	has_many :messages
	# has_many :courses, through: :messages
	before_save {self.email = email.downcase}
	before_create :create_remember_token
	validates :first_name, presence: true, length: { maximum: 50}
	validates :last_name, presence: true, length: { maximum: 50}
	# wichita.edu REGEX  /\A[\w+\-.]+@wichita.edu
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive: false}
	has_secure_password
	validates :password, length: { minimum: 6 }
	#before_create :no_signup

	def no_signup
		false
	end


	def User.new_remember_token
    	SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
	 	self.remember_token = User.digest(User.new_remember_token)
	end
end
