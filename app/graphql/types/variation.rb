module Types
  class Variation < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :width, Integer, null: true
    field :height, Integer, null: true
    field :texture, Types::Texture, null: true
  end
end
