require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
  describe 'As a visitor' do
    it 'can see the welcome message' do
      visit('/')

      expect(page).to have_content('Welcome to my image portfolio.')
    end
  end
end