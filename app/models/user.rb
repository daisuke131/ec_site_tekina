# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :products, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :like_products, through: :favorites, source: :product
  validates :name, presence: true
  mount_uploader :image, UserImageUploader
  include Hashid::Rails
end
