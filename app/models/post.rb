class Post < ActiveRecord::Base
	validates :text, :user_id, :title, presence: true
	belongs_to :user
	has_many :comments
end
