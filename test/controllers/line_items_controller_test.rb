require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
	test "should create line_item" do
		assert_difference('LineItem.count') do
			post line_items_url, params: { product_id: products(:ruby).id }
		end

		follow_redirect!
	
		assert_select 'h2', 'Your Pragmatic Cart'
		assert_select 'li', "1 \u00D7 Programming Ruby 1.9"
	end
end
