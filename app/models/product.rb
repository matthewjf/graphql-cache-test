class Product < ApplicationRecord
  has_many :variations, inverse_of: :product

  scope :active, -> { where(active: true) }
end
