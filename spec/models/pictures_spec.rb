require 'rails_helper'

RSpec.describe Pictures, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:device) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:year) }
  end
end