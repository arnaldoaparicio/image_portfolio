require 'rails_helper'

RSpec.describe 'Picture New Page', type: :feature do
  before(:each) do
    file = Rails.root.join('spec', 'test_image', 'image1.jpg')
    picture = ActiveStorage::Blob.create_and_upload!(io: File.open(file, 'rb'), filename: 'image1.jpg', content_type: 'image/jpeg').signed_id

    image1 = Picture.create!(title: 'Sunset in Mexico',
                description: "This is a picture of the sunset near my grandfather's house.",
                type_of_picture: 'landscape',
                device: 'iPhone 7',
                location: 'Puebla, Mexico',
                year: 2017,
                personal_pic: picture)

    image2 = Picture.create!(title: 'Baby Charlie',
                description: "A picture of baby Charlie being held like a bottle of water.",
                type_of_picture: 'animal',
                device: 'Sony a6100',
                location: 'Somewhere in New Jersey',
                year: 2022,
                personal_pic: picture)

    image3 = Picture.create!(title: 'East Point Shore',
                description: "Took a day trip with my partner at the East Point Lighthouse and decided to take a picture by the shore.",
                type_of_picture: 'landscape',
                device: 'iPhone SE (3rd Gen.)',
                location: 'Maurice River, NJ',
                year: 2022,
                personal_pic: picture)

    image4 = Picture.create!(title: 'Crabbing by the River',
                description: "A few hours into crabbing since 3am that morning. It was about 9am and decided to take a picture of the river.",
                type_of_picture: 'landscape',
                device: 'iPhone XS Max',
                location: 'Maurice River, NJ',
                year: 2019,
                personal_pic: picture)

    image5 = Picture.create!(title: 'Tippy Tina Sleeping',
                description: "Decided to visit my friend Helga and wanted to take a picture of her house pig, Tippy Tina.",
                type_of_picture: 'animal',
                device: 'iPhone 8',
                location: 'Hopewell, NJ',
                year: 2023,
                personal_pic: picture)

    image6 = Picture.create!(title: 'Three Puppers',
                description: "Worked a day at Gardie's Doggy Day Camp and captured this precious picture of three sisters.",
                type_of_picture: 'animal',
                device: 'iPhone XR',
                location: 'Elmer, NJ',
                year: 2023,
                personal_pic: picture)
  end

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
  end
end