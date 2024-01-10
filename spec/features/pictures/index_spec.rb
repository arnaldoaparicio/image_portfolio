require 'rails_helper'

RSpec.describe 'Pictures Index Page', type: :feature do
  xit 'can see the porfolio message' do
    visit('/pictures')

    expect(page).to have_content('This is my portfolio.')
  end

  it 'shows link to submit new picture' do
    visit('/pictures')

    click_link ('Submit New Picture')
    expect(current_path).to eq('/pictures/new')
  end
end