require 'rails_helper'

RSpec.describe Compagny, type: :model do
    describe 'instantiation' do
        let!(:compagny) { build(:compagny) }

        it 'instantiates a compagny' do
            expect(compagny.class.name).to eq("Compagny")
        end
    end
end
