require "rails_helper"

RSpec.feature "Request" do

let(:ruby) {build(:ruby)}
let(:cart) {build(:cart)}

	scenario "GET /" do
    	visit  store_index_path
    	expect(response).to have_http_status(200)
    	expect(page).to have_content 'h1', "Your Pragmatic Catalog"
	end
	
	scenario "User selects a product adding it to his cart" do
		visit  store_index_path
		expect(response).to have_http_status(200)
		find_button('Add to Cart').click
		expect(page).to have_current_path(line_items_path(product_id: product))
		page.find(cart_id: cart)
		expect(cart.line_items.size).to eq(1)
		expect(cart.line_items[0].product).to eq(:ruby)
	end



end


