require 'rails_helper'

RSpec.describe 'Picture New Page', type: :feature do
  it 'can see and fill out the form' do
    visit('/pictures/new')

    expect(page).to have_content('Add New Picture')

    fill_in 'title', with: 'Pic at Cancun'
    fill_in 'description', with: 'A pretty cool pic'
    fill_in 'type_of_picture', with: 'landscape'
    fill_in 'device', with: 'iPhone 7'
    fill_in 'location', with: 'Cancun, Mexico'
    fill_in 'year', with: 2012
    attach_file('personal_pic', 'spec/test_image/image1.jpg')

    click_on 'Submit Picture'

    expect(current_path).to eq('/pictures')
    expect(page).to have_content('Pic at Cancun')
  end
end