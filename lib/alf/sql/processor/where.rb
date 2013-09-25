module Alf
  module Sql
    class Processor
      class Where < Processor
        grammar Sql::Grammar

        def initialize(predicate, builder = Builder.new)
          super(builder)
          @predicate = predicate
        end

        def on_select_exp(sexpr)
          pred = @predicate.rename(sexpr.desaliaser).sexpr
          if sexpr.where_clause
            anded = [:and, sexpr.where_clause.bool_exp, pred ]
            anded = Alf::Predicate::Grammar.sexpr(anded)
            sexpr.with_update(:where_clause, [ :where_clause, anded ])
          else
            sexpr.with_insert(4, [ :where_clause, pred ])
          end
        end

      end # class Where
    end # class Processor
  end # module Sql
end # module Alf
