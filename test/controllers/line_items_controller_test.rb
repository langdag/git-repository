require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest

	setup do 
		@line_item = line_items(:one)
	end
	
	test "should create line_item" do
		assert_difference('LineItem.count') do
			post line_items_url, params: { product_id: products(:ruby).id }
		end

		follow_redirect!
	
		assert_select 'h2', 'Your Cart'
		assert_select 'td', "Programming Ruby 1.9"
	end

	test "should update line_item" do
		patch line_item_url(@line_item), 
			params: { line_item: { product_id: @line_item.product_id }}
		assert_redirected_to line_item_url(@line_item.product_id)
	end

	test "should create line_item via ajax" do
		assert_difference('LineItem.count') do
			post line_items_url, params: { product_id: products(:ruby).id },
				xhr: true
		end

		assert_response :success
		assert_select_jquery :html, '#cart' do
			assert_select 'tr#current_item td', /Programming Ruby 1.9/
		end
	end
end
