require 'rails_helper'

describe Review, type: :model do
  subject { build(:review) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:book).without_validating_presence }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a content' do
      subject.content = nil
      expect(subject).to_not be_valid
    end
  end
end
