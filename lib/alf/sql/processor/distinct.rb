module Alf
  module Sql
    class Processor
      class Distinct < Processor

        def on_set_quantified(sexpr)
          sexpr.with_update(1, builder.distinct)
        end
        alias :on_union      :on_set_quantified
        alias :on_except     :on_set_quantified
        alias :on_intersect  :on_set_quantified
        alias :on_select_exp :on_set_quantified

      end # class Distinct
    end # class Processor
  end # module Sql
end # module Alf
