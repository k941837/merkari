class Item < ApplicationRecord
  # belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  # belongs_to :brand
  # belongs_to :category
end
