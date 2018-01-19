class Product < ApplicationRecord
  resourcify
  belongs_to :user

  has_many :order_items
  scope :active, -> { where(active: true) }
  
  mount_uploader :images, ImagesUploader

end
