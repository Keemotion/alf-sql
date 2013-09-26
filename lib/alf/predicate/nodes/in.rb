module Alf
  class Predicate
    module In

      def to_sql(buffer = "")
        identifier.to_sql(buffer)
        buffer << Sql::Expr::SPACE << Sql::Expr::IN << Sql::Expr::SPACE
        if values.respond_to?(:to_sql)
          values.to_sql(buffer)
        else
          buffer << Sql::Expr::LEFT_PARENTHESE
          values.each_with_index do |val,index|
            buffer << Sql::Expr::COMMA << Sql::Expr::SPACE unless index==0
            to_sql_literal(buffer, val)
          end
          buffer << Sql::Expr::RIGHT_PARENTHESE
        end
        buffer
      end

    end
  end
end
