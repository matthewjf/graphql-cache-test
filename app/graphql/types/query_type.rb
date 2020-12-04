module Types
  class QueryType < Types::BaseObject
    field :products_without_cache, null: false, resolver: Resolvers::ProductsWithoutCache
    field :products_with_fragment_cache, null: false, resolver: Resolvers::ProductsWithFragmentCache
    field :products_with_cache_expiration, null: false, resolver: Resolvers::ProductsWithCacheExpiration
  end
end
