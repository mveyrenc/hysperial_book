# frozen_string_literal: true

require 'rails_helper'

module Users
  RSpec.describe UpdateInteractor, type: :interactor do
    describe '.call' do
      let(:current_role) { create(:role) }
      let(:user_to_test) { create(:user_with_role, role: current_role) }
      let(:new_role) { create(:role) }

      let(:valid_attributes) do
        {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          role: new_role.id
        }
      end

      subject(:context) do
        described_class.call(user: user_to_test, params: valid_attributes)
      end

      context 'when the user exists' do

        it 'succeeds' do
          expect(context).to be_a_success
        end

        it 'provides the user' do
          expect(context.user).to eq(user_to_test)
        end

        it 'user is set with new name' do
          expect(context.user.name).to eq(valid_attributes[:name])
        end

        it 'user is set with new email' do
          expect(context.user.email).to eq(valid_attributes[:email])
        end

        it 'user is set with new role' do
          expect(context.user.role).to eq(new_role.id)
        end
      end
    end
  end
end
