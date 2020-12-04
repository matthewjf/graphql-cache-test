module Resolvers
  class Base < GraphQL::Schema::Resolver
    include GraphQL::FragmentCache::ObjectHelpers
    include GraphQL::Execution::Interpreter::HandlesRawValue
  end
end
