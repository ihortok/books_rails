require 'rails_helper'

describe BookReaction, type: :model do
  subject { build(:book_reaction) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:book).without_validating_presence }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    context 'when the same book reaction already exists' do
      before { create(:book_reaction, user: subject.user, book: subject.book) }

      it 'is not valid' do
        expect(subject).to_not be_valid
      end
    end
  end
end
