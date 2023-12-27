require 'rails_helper'

RSpec.describe 'Portfolio Index Page', type: :feature do
  it 'can see the porfolio message' do
    visit('/portfolio')

    expect(page).to have_content('This is my portfolio.')
  end

  it 'shows link to submit new picture' do
    visit('/portfolio')

    click_link ('Submit New Picture')
    expect(current_path).to eq('/portfolio/new')
  end
end