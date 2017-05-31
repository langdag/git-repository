FactoryGirl.define do 
	
	factory :line_item do 		
  		product 
 		cart 
 	end

 	factory :two, parent: :line_item do 
  		association :product, factory: :ruby
  		association :order, factory: :dave 
	end
end