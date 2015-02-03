class Comment < ActiveRecord::Base
	validates :post_id, :user_id, :text, presence: true

	belongs_to :post
	belongs_to :user
end
