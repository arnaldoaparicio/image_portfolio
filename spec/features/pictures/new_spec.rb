require 'rails_helper'

RSpec.describe 'Pictures New Page', type: :feature do
  it 'can see and fill out the form' do
    visit('/pictures/new')

    expect(page).to have_content('Add New Picture')

    fill_in 'Title', with: 'Pic at Cancun'
    fill_in 'Description', with: 'A pretty cool pic'
    fill_in 'Type', with: 'landscape'
    fill_in 'Device', with: 'iPhone 7'
    fill_in 'Location', with: 'Cancun, Mexico'
    fill_in 'Year', with: 2012

    click_on 'Submit Picture'

    expect(current_path).to eq('/pictures')
    expect(page).to have_content('Pic at Cancun')
  end
end