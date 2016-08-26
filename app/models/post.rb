class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates_presence_of :title, :content

	has_attached_file :image
	
	acts_as_commontable

	def self.datesort
		order(created_at: :desc)
	end
end
