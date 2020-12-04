module Types
  class BaseObject < GraphQL::Schema::Object
    include GraphQL::FragmentCache::Object

    field_class Types::BaseField
  end
end
