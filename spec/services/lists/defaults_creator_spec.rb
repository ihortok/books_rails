require 'rails_helper'

describe Lists::DefaultCreator do
  let!(:user) { create(:user) }
  subject { Lists::DefaultCreator.new(user) }

  it 'creates default lists for a user' do
    expect { subject.call }.to change(List, :count).by 2

    user_lists_titles = user.lists.pluck(:title).uniq

    expect(user_lists_titles).to eq(
      [I18n.t('lists.default.favorite'),
       I18n.t('lists.default.want_to_read')]
    )
  end
end
