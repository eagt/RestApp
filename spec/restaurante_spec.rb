require 'rails_helper'

RSpec.describe Restaurante, type: :model do
  subject { 
    described_class.new(name: "Restaurante 1",
                        address_1: "123 Test St",
                        address_2: "Apt 4B",
                        post_code: "12345",
                        email: "test@test.com",
                        telephone: "123-456-7890",
                        mobile: "098-765-4321",
                        VAT: "123456789",
                        NIT: 123456789,
                        city: "Test City",
                        country: "Test Country") 
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  #it "is not valid without a address_1" do
  #  subject.address_1 = nil
  #  expect(subject).to_not be_valid
  #end

  # ... repeat for other non-mandatory attributes ...

 it 'is not valid with a duplicate name' do
    Restaurante.create(name: "Restaurante 1")
    expect(Restaurante.new(name: "Restaurante 1")).to_not be_valid
  end

  # ... repeat for other non-mandatory attributes ...‹

end