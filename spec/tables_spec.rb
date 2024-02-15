require 'rails_helper'

RSpec.describe Table, type: :model do
  let(:restaurante) { Restaurante.create(name: "Test Restaurante") } # More attributes can be added if needed

  subject {
    described_class.new(number: "1",
                        restaurante: restaurante,
                        status: "Funcional")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a number" do
    subject.number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a restaurante" do
    subject.restaurante = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a status" do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate number' do
    Table.create(number: "1", restaurante: restaurante, status: "Funcional")
    expect(Table.new(number: "1", restaurante: restaurante, status: "Funcional")).to_not be_valid
  end
  
end