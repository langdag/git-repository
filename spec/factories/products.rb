FactoryBot.define do
	factory :product do
		title "MyString"
  		description "MyText"
  		image_url "MyString"
  		price 9.99
	end

	factory :ruby, parent: :product do
		title "Programming Ruby 1.9"
		description "Ruby is the fastest growing and most exciting
        			dynamic language out there. If you need to get
        			working programms delivered fast, you should add
        			Ruby to your toolbox."
		image_url	"ruby.png"
		price	49.50
	end
end

 