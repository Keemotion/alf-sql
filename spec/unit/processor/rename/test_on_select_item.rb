require 'spec_helper'
module Alf
  module Sql
    module Processor
      describe Rename, "on_select_item" do

        subject{ Rename.new(Renaming[a: :x]).on_select_item(expr) }

        context 'when included' do
          let(:expr){ select_item('a', 'a') }

          it{ should eq(select_item('a', 'x')) }
        end

        context 'when already a renaming' do
          let(:expr){ select_item('b', 'a') }

          it{ should eq(select_item('b', 'x')) }
        end

        context 'when not matching' do
          let(:expr){ select_item('a', 'y') }

          it{ should be(expr) }
        end

      end
    end
  end
end
