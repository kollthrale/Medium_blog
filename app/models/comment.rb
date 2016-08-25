class Comment < ApplicationRecord
	belongs_to :post
	validates_presence_of :opinion
	acts_as_commontator
end
