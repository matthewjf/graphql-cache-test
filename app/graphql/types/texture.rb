module Types
  class Texture < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :default, Boolean, null: false
    field :active, Boolean, null: false
  end
end
