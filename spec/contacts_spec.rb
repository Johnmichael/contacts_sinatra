require('contact')
require('rspec')
require('pry')

describe('Contacs') do
  describe('#initialize') do
    contact = Contact.new({"first_name" => "Tim", "last_name" => "Teach", "phone_number" => "555-555-5555", "email" => "tim@epicodus.com"})

    it("saves initializtion values as intance variables") do
      expect(contact.first_name).to eq("Tim")
    end

    it("saves initializtion values as intance variables") do
      expect(contact.last_name).to eq("Teach")
    end

    it("saves initializtion values as intance variables") do
      expect(contact.phone_number).to eq("555-555-5555")
    end

    it("saves initializtion values as intance variables") do
      expect(contact.email).to eq("tim@epicodus.com")
    end
  end
end
