require 'rails_helper'

RSpec.feature "User navigates from home page to product page", type: :feature, js: true do
  
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

  scenario "users click on product and visit the individual product page" do
    visit root_path

    # clicks on the first product header on page
    first('article.product').find_link('Details').click
    
    puts page.html
    
    # page.has_css?(".product")
    # expect(page).to have_css(".product")
    # checks page for more details that are available tags etc
    page.has_content?('Quantity')
    save_screenshot

  end

end
