FactoryGirl.define do 
	factory :order do 
	 	name "MyString"
  		address "MyText"
  		email "MyString"
  		pay_type 1
	end

	factory :dave, parent: :order do
		name "Dave Thomas"
  		address "MyText"
  		email "dave@example.org"
  		pay_type "Check"
	end
end