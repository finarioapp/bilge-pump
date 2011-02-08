module BilgePump
  module Specs
    def bilge_assert_response(expected_response)
      response.should send("be_#{expected_response}")
    end

    def bilge_assert_new_record(item_assign_name)
      assigns(item_assign_name).should be_new_record
    end

    def bilge_assert_includes(collection, item)
      collection.should be_member(item)
    end

    def bilge_assert_equal(expected, actual)
      actual.should == expected
    end

    def bilge_refute_existence(m)
      model_class.should_not be_exists(m.id)
    end

    def self.included(mod)
      mod.class_eval do
        render_views

        def self.bilge_setup(*args, &block)
          before(:each, &block)
        end

        def self.bilge_test(*args, &block)
          it(*args, &block)
        end

        include AgnosticTests
      end
    end
  end
end