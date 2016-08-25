class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates_presence_of :title, :content
	acts_as_commontable

end
