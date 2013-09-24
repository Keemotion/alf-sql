require 'spec_helper'
module Alf
  module Sql
    describe ColumnName, "as_name" do

      subject{ expr.as_name }

      let(:expr){ column_name_a }

      it{ should eq("a") }

    end
  end
end
