class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_one :image, dependent: :destroy
  has_attached_file :image,
                    styles: { thumb: ["64x64#", :jpg],
                          original: ['500x500>', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                                    original: "-quality 85 -strip" },
                    url: "/system/:hash.:extension", hash_secret: "abc123"
  validates_attachment :image, presence: true,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    acts_as_commontator
end
