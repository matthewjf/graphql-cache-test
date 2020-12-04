module Resolvers
  class ProductsWithCacheExpiration < Base
    type [Types::Product], null: false

    def resolve
      if cached_value.present?
        puts '************************** RETURNING CACHED VALUE'
        return raw_value(cached_value)
      end

      products_scope
    end

    def products_scope
      @products_socpe ||= Product.includes(variations: :texture)
    end

    def cached_value
      Rails.cache.read(cache_key)&.[]('data')&.[]('productsWithCacheExpiration')
    end

    def cache_key
      context['cache_key'] = context.query.fingerprint + products_scope.cache_key
    end
  end
end
