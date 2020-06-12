class Picture < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, presence: true
  validates :image, presence:true
  mount_uploader :image, ImageUploader
  belongs_to :user
end
