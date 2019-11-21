require 'rails_helper'

# feature block => describe block
# scenario block => it block

# Our tests are not checking for pixel placement but instead going to do DOM analysis and interaction to make sure the pages function and display the correct information. 
# In other words we are testing UX (User Experience) more than we are testing UI (User Interface)
# The reason our page looks a bit broken is that our home page is using Flexbox to render the grid and this version of Webkit does not support it.

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
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

  scenario "They see all products" do
    # ACT
    visit root_path


    # DEBUG
    save_and_open_screenshot

    expect(page).to have_css 'article.product', count: 10
  end
end