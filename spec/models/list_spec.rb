require 'rails_helper'

describe List, type: :model do
  subject { build(:list) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }

    it { should have_and_belong_to_many(:books) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end
end
