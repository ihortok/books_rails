require 'rails_helper'

describe Book, type: :model do
  subject { build(:book) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:author).without_validating_presence }

    it { should have_many(:book_reactions).dependent(:destroy) }
    it { should have_and_belong_to_many(:lists) }
    it { should have_one_attached(:image) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an original title' do
      subject.original_title = nil
      expect(subject).to_not be_valid
    end

    xit 'is not valid when image exceeds allowed size' do
      # TODO: add a test
    end
  end
end
