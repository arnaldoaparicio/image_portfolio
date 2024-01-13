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

  it "selects all pictures in the 'landscape' category" do
    image1 = Picture.create!(title: 'Sunset in Mexico',
                    description: "This is a picture of the sunset near my grandfather's house.",
                    type_of_picture: 'landscape',
                    device: 'iPhone 7',
                    location: 'Puebla, Mexico',
                    year: 2017)

    image2 = Picture.create!(title: 'Baby Charlie',
                    description: "A picture of baby Charlie being held like a bottle of water.",
                    type_of_picture: 'animal',
                    device: 'Sony a6100',
                    location: 'Somewhere in New Jersey',
                    year: 2022)

    image3 = Picture.create!(title: 'East Point Shore',
                    description: "Took a day trip with my partner at the East Point Lighthouse and decided to take a picture by the shore.",
                    type_of_picture: 'landscape',
                    device: 'iPhone SE (3rd Gen.)',
                    location: 'Maurice River, NJ',
                    year: 2022)

    image4 = Picture.create!(title: 'Crabbing by the River',
                    description: "A few hours into crabbing since 3am that morning. It was about 9am and decided to take a picture of the river.",
                    type_of_picture: 'landscape',
                    device: 'iPhone XS Max',
                    location: 'Maurice River, NJ',
                    year: 2019)

    landscapes = Picture.all_landscapes

    expect(landscapes.count).to eq(3)
    landscapes.each do |landscape|
      expect(landscape.type_of_picture).to eq('landscape')
    end
  end
end