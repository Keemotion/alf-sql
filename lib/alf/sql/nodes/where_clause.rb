module Alf
  module Sql
    module WhereClause
      include Expr

      WHERE = "WHERE".freeze

      def predicate
        last
      end

      def to_sql(buffer = "")
        buffer << WHERE << SPACE
        predicate.to_sql(buffer)
        buffer
      end

    end # module WhereClause
  end # module Sql
end # module Alf
