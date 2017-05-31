require "rails_helper"

RSpec.feature "Request" do

	scenario "GET /" do
      visit  store_index_path
      expect(response).to have_http_status(200)
      expect(page).to have_content 'h1', "Your Pragmatic Catalog"
	end
	
	scenario "User selects a product adding it to his cart"
		




	end



end


