class Admin::DashboardController < ApplicationController
  def show
    @number_of_products = Product.count
    @number_of_categories = Category.count
  end
end

# Display a count of how many products are in the database
# Display a count of how many categories are in the database