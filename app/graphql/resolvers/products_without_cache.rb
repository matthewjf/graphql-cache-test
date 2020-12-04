module Resolvers
  class ProductsWithoutCache < Base
    type [Types::Product], null: false

    def resolve
      Product.includes(variations: :texture)
    end
  end
end
