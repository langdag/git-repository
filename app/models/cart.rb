class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy
	cart = Cart.find(LineItem.cart_id)
	puts "This cart has #{cart.line_items.count} line items"
end
