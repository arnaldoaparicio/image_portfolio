require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:type_of_picture) }
    it { should validate_presence_of(:device) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:year) }
  end

  it 'is valid if image is attached' do
    file = Rails.root.join('spec', 'test_image', 'image1.jpg')
    image = ActiveStorage::Blob.create_and_upload!(io: File.open(file, 'rb'), filename: 'image1.jpg', content_type: 'image/jpeg').signed_id

    picture_params = { title: 'Pic at Cancun',
                       description: 'A pretty cool pic',
                       type_of_picture: 'landscape',
                       device: 'iPhone 7',
                       location: 'Cancun, Mexico',
                       year: 2012,
                       personal_pic: image }
    picture = Picture.create!(picture_params)

    expect(picture.personal_pic.valid?).to eq(true)
  end
end