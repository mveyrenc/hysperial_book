# frozen_string_literal: true

require 'rails_helper'

module Users
  RSpec.describe DestroyInteractor, type: :interactor do
    describe '.call' do
      let(:user_to_test) { create(:user) }

      subject(:context) { described_class.call(user: user_to_test) }

      context 'when the user exists' do
        before do
          allow(user_to_test).to receive(:destroy).and_return(true)
        end

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
