require 'rails_helper'

RSpec.describe 'Picture Index Page', type: :feature do
  xit 'shows link to submit new picture' do
    visit('/pictures')

    expect(page).to have_link('Submit New Picture')

    click_link ('Submit New Picture')
    expect(current_path).to eq('/pictures/new')
  end

  xit 'shows categories of pictures' do
    visit('/pictures')

    expect(page).to have_content('Animals')
    expect(page).to have_content('Landscapes')
  end
end