require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy }

  permissions :access? do
    context 'when a user\'s role in: user, author, editor' do
      it 'denies access' do
        expect(subject).not_to permit(create(:user))
        expect(subject).not_to permit(create(:user, :author))
        expect(subject).not_to permit(create(:user, :editor))
      end
    end

    it 'grants access to admin' do
      expect(subject).to permit(create(:user, :admin))
    end
  end
end
