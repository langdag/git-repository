require "rails_helper"

RSpec.feature "Request" do

let(:product) {create(:ruby)}
let(:order) {create(:dave)}
let(:mail) { OrderMailer.received(order) }

	scenario "GET /" do
    	visit '/'
    	expect(page).to have_http_status(:success)
    	expect(page).to have_content "Your Pragmatic Catalog"
	end

background do
	@products = product
	@cart = Cart.all
	@line_items = LineItem.all
	@orders = Order.all

end	

	scenario "User selects a product and adds it to his cart" do
		
		visit store_index_path
		expect(page).to have_http_status(:success)
		click_button ('Add to Cart')
		expect(@line_items.size).to eq(1)
		expect(@cart.size).to eq(1)
		expect(page).to have_content("Programming Ruby 1.9", wait: 5)
		click_button ('Checkout')
		expect(page).to have_current_path(new_order_path)
		expect(page).to have_http_status(:success)
		expect(page).to have_selector('legend', text: "Please Enter Your Details")
		within ("fieldset") do
			fill_in 'Name', with: 'Dave Thomas'
			fill_in 'Address', with: 'MyText'
			fill_in 'Email', with: 'dave@example.org'
			select 'Check', from: 'Pay type'
		end
		click_button 'Place Order'
		expect(page).to have_current_path(store_index_path)
		expect(page).to have_http_status(:success)
		expect(page).to have_selector('h1', text: "Your Pragmatic Catalog")
		expect(page).to have_selector('#notice', text: "Thank you for your order.")
		expect(@orders.size).to eq(1)
		@order = Order.find(1)
		expect(@order.name).to eq("Dave Thomas")
		expect(@order.address).to eq("MyText")
		expect(@order.email).to eq("dave@example.org")
		expect(@order.pay_type).to eq("Check")
			
		puts page.html
		binding.pry
		expect(mail.subject).to eq("Pragmatic Store Order Confirmation")
      	expect(mail.to).to eq(["dave@example.org"])
      	expect(mail.from).to eq(["depot@example.com"])	
		

		
		
		#within ("//form[action='/line_items?product_id=207281424']") do
			#click_button('Add to Cart')
		#end
		#expect(@line_items.size).to eq(1)
		#Cart.find(session[:cart_id])
		#page.find(cart_id: cart)
		#expect(cart.line_items.size).to eq(1)
		#expect(cart.line_items[0].product).to eq(:ruby)
	

	end

end


#using_wait_time 10 do
			#page.find_button('Add to cart').click
#		end