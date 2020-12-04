module Instrumentation
  module Cache
    module_function

    def before_query(_)
      # noop
    end

    def after_query(query)
      puts "************************** QUERY END: #{query.fingerprint}"
      cache_key = query.context['cache_key']
      Rails.cache.write(cache_key, query.result.to_h) if cache_key.present?
    end
  end
end
