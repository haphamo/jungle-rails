class Admin::DashboardController < ApplicationController
  def show
    @number_of_products = Product.count
    @number_of_categories = Category.count
  end
end

# Stretch
# Try to make it look nice, using Bootstrap 3 elements.
# Link to the product and category admin list/index pages when displaying the counts.