FactoryBot.define do 	
	factory :one do 		
  		product 
 		cart 
 	end

 	factory :two, parent: :one do 
  		association :product, factory: :ruby
  		association :order, factory: :dave 
	end
end