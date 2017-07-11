require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        image: open_asset('apparel1.jpg'),
        price: 64.99


      )
    end
  end
  scenario "Click product to details" do
    visit root_path
    first('.pull-right').click
    expect(page).to have_content(@category.products.first.name)
    save_screenshot
  end
end
