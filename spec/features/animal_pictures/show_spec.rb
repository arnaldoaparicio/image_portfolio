require 'rails_helper'

RSpec.describe 'Animal Pictures Show Page' do
  it 'shows the details of an Animal Picture' do
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

    visit("/pictures/animal_pictures/#{picture.id}")

    expect(page).to have_content('Pic at Cancun')
    expect(page).to have_content('A pretty cool pic')
    expect(page).to have_content('Cancun, Mexico')
    expect(page).to have_content('2012')
    expect(page).to have_content('iPhone 7')
  end
end