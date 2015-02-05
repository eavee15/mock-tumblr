class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	def display_status
		if self.status == 0
			"closed"
		elsif self.status == 1
			"open"
		elsif self.status == 2
			"pending"
		else
			"not set"
		end
	end
end

