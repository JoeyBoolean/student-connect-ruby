class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	validates :message, presence: true, length: {maximum:250} 
end
