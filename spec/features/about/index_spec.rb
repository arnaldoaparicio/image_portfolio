require 'rails_helper'

RSpec.describe 'About Index Page', type: :feature do
  describe 'As a visitor' do
    it 'can see the about page' do
      visit('/about')

      expect(page).to have_content('This is my image repository.')
    end
  end
end