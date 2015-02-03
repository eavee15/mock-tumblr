class User < ActiveRecord::Base
	validates :password, :email, :username, presence: true
	validates :password, confirmation: true
	validates :password, length: {minimum: 6}
	validates :email, uniqueness: true

	has_many :posts, 
	has_many :comments, through: :posts

	has_many :relationships, 
		class_name: "Follower",
		foreign_key: :follower_id,
		dependent: :destroy

	has_many :leaderships,
		class_name: "Follower",
		foreign_key: :leader_id,
		dependent: :destroy

	has_many :followers,
		through: :leaderships,
		source: :follower

	has_many :leaders,
		through: :relationships,
		source: :leader
		
end
end
