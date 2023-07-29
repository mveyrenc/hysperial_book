# frozen_string_literal: true

require 'rails_helper'

module Users
  RSpec.describe Users::Interactors::List, type: :interactor do
    describe '.call' do
      let(:user_to_test) { create(:user) }

      subject(:context) { described_class.call }

      context 'when the user exists' do
        before { allow(User).to receive(:all).and_call_original }

        it 'succeeds' do
          expect(context).to be_a_success
        end

        it 'provides the user' do
          expect(context.list).to include(user_to_test)
        end
      end
    end
  end
end
