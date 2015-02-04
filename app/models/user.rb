class User < ActiveRecord::Base
	validates :email, presence: true
	validates :password, presence: true
	validates :password, length: {minimum: 6}

	has_many :posts
	has_many :comments

		
end

