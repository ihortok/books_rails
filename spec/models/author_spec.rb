require 'rails_helper'

describe Author, type: :model do
  subject { build(:author) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }

    it { should have_many(:books) }
    it { should have_one_attached(:image) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an original name' do
      subject.original_name = nil
      expect(subject).to_not be_valid
    end

    xit 'is not valid when image exceeds allowed size' do
      # TODO: add a test
    end
  end
end
