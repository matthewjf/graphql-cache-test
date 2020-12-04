class GraphqlCacheTestSchema < GraphQL::Schema

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST
  use GraphQL::FragmentCache
  use ApolloFederation::Tracing

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections

  instrument(:query, Instrumentation::Cache)

  query(Types::QueryType)
end
