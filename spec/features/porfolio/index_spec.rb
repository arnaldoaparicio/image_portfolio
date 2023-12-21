require 'rails_helper'

RSpec.describe 'Portfolio Index Page', type: :feature do

  it 'can see the porfolio message' do
    visit('/portfolio')

    expect(page).to have_content('This is my portfolio.')
  end
end