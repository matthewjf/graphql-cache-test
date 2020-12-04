module Resolvers
  class ProductsWithFragmentCache < Base
    type [Types::Product], null: false

    def resolve
      cache_fragment { Product.includes(variations: :texture) }
    end
  end
end
