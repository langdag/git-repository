require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
	setup do
    @update = {
      name:        'Jack',
      address:  'Boulevard 15',
      email:    'town@.gmail.com',
      pay_type:  "Check"
    }
  end

	test "requires item in cart" do
		get new_order_url
		assert_redirected_to store_index_path
		assert_equal flash[:notice], 'Your cart is empty'
	end

	test "should get new" do
		post line_items_url, params: { product_id: products(:ruby).id }
		
		get new_order_url
		assert_response :success
	end

	test "should create order" do
		assert_difference('Order.count') do
			post orders_url, params: { order: @update }
		end

		assert_redirected_to store_index_url
	end
end
