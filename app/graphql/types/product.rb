module Types
  class Product < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :label_id, Integer, null: true
    field :active, Boolean, null: false
    field :variations, [Types::Variation], null: false

    def variations
      cache_fragment(object.variations.cache_key) { object.variations }
    end
  end
end
