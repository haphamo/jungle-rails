require 'rails_helper'
# have to come back to this
# feature block => describe block
# scenario block => it block

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

  scenario "Click and view one product" do
    # ACT
    visit root_path
    click_on 'product'

    # DEBUG
    save_and_open_screenshot

    expect(page).to have_css 'article.product', count: 10
  end
end