class Variation < ApplicationRecord
  belongs_to :product, inverse_of: :variations
  belongs_to :texture, inverse_of: :variations, optional: true

  scope :active, -> { where(active: true) }
end
