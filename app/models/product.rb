class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :solds, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image1, presence: true
  mount_uploader :image1, ProductImage1Uploader
  mount_uploader :image2, ProductImage2Uploader
  mount_uploader :image3, ProductImage3Uploader
  include Hashid::Rails
end
