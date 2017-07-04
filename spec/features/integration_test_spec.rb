require "rails_helper"

RSpec.feature "Request" do

let(:product) {create(:ruby)}
let (:order) {create(:dave)}

	scenario "GET /" do
    	visit '/'
    	expect(page).to have_http_status(:success)
    	expect(page).to have_content "Your Pragmatic Catalog"
	end

background do
	@products = product
	@cart = Cart.all
	@line_items = LineItem.all
end	

	scenario "User selects a product and adds it to his cart" do
		
		visit store_index_path
		expect(page).to have_http_status(:success)
		click_button ('Add to Cart')
		expect(@line_items.size).to eq(1)
		expect(@cart.size).to eq(1)
		expect(page).to have_content("Programming Ruby 1.9", wait: 5)
		puts page.html
		binding.pry
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