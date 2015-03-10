require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'instantiation' do
        let!(:customer) { build(:customer) }

        it 'instantiates a customer' do
            expect(customer.class.name).to eq("Customer")
        end
    end
end
