class Course < ActiveRecord::Base
	has_many :assignments
	has_many :users, through: :assignments
	has_many :messages
	has_many :users, through: :messages
end
