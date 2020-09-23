require 'rails_helper'

RSpec.feature "Visitor adds items to cart", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User can add products to cart from home page" do
    visit root_path
    first('article.product').find_button('Add').click

    page.has_content?('My Cart (1)')
    save_screenshot
    # expect(page).to have_css 'article.product'
  end

end