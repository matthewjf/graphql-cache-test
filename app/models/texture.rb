class Texture < ApplicationRecord
  has_many :variations, inverse_of: :texture
end
