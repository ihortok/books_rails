require 'rails_helper'

describe User, type: :model do
  subject { build(:user) }
  let(:author) { build(:user, :author) }
  let(:editor) { build(:user, :editor) }
  let(:admin) { build(:user, :admin) }

  describe 'associations' do
    it { should have_many(:authors).dependent(:nullify) }
    it { should have_many(:books).dependent(:nullify) }
    it { should have_many(:book_reactions).dependent(:destroy) }
    it { should have_many(:lists).dependent(:destroy) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a nickname' do
      subject.nickname = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a locale' do
      subject.locale = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#author_or_higher?' do
    it { expect(subject.author_or_higher?).to be false }

    it { expect(author.author_or_higher?).to be true }
    it { expect(editor.author_or_higher?).to be true }
    it { expect(admin.author_or_higher?).to be true }
  end

  describe '#editor_or_higher?' do
    it { expect(subject.editor_or_higher?).to be false }
    it { expect(author.editor_or_higher?).to be false }

    it { expect(editor.editor_or_higher?).to be true }
    it { expect(admin.editor_or_higher?).to be true }
  end
end
