module Alf
  module Sql
    module Intersect
      include Nadic

      INTERSECT = "INTERSECT".freeze

      def keyword
        INTERSECT
      end

    end # module Intersect
  end # module Sql
end # module Alf
