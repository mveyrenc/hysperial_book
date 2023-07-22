# frozen_string_literal: true

require 'rails_helper'

module Users
  RSpec.describe GetUserInteractor, type: :interactor do
    describe '.call' do
      let(:user_to_test) { create(:user) }

      subject(:context) { described_class.call(id: user_to_test.id) }

      context 'when the user exists' do
        before { allow(User).to receive(:find).with(context.id).and_return(user_to_test) }

        it 'succeeds' do
          expect(context).to be_a_success
        end

        it 'provides the user' do
          expect(context.user).to eq(user_to_test)
        end
      end
    end
  end
end
