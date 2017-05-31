require "rails_helper"

RSpec.feature "Request" do

let(:ruby) {build(:ruby)}
let(:cart) {build(:cart)}

	scenario "GET /" do
    	visit  '/'
    	expect(page).to have_http_status(:success)
    	expect(page).to have_content "Your Pragmatic Catalog"
	end
	
	scenario "User selects a product adding it to his cart" do
		visit  store_index_path
		expect(page).to have_http_status(:success)
		page.find(".price_line").click_button('Add to Cart')
		expect(page).to have_current_path(line_items_path(product_id: product))
		page.find(cart_id: cart)
		expect(cart.line_items.size).to eq(1)
		expect(cart.line_items[0].product).to eq(:ruby)
	end



end


