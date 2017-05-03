require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do

    let(:order){ Order.create!(
      :name => "Dave Thomas",
      :address => "MyText",
      :email => "dave@example.org",
      :pay_type => "Check"
    )}

  describe "received" do
    let(:mail) { OrderMailer.received(order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Pragmatic Store Order Confirmation")
      expect(mail.to).to eq(["dave@example.org"])
      expect(mail.from).to eq(["depot@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("You ordered the following items.")
    end
  end

  describe "shipped" do
    let(:mail) { OrderMailer.shipped(order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Pragmatic Store Order Shipped")
      expect(mail.to).to eq(["dave@example.org"])
      expect(mail.from).to eq(["depot@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Description")
    end
  end

end
