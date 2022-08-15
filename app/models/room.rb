class Room < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :reservations
  has_many :users, through: :reservations
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
