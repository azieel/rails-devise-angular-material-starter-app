require 'rails_helper'

RSpec.describe Admin, type: :model do
    describe 'instantiation' do
        let!(:admin) { build(:admin) }

        it 'instantiates an admin' do
            expect(admin.class.name).to eq("Admin")
        end
    end
end
