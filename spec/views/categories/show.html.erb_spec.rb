require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do

    @category = assign(:category, Category.new(name: "Category1", id: 123))
    @category_name = @category.name

    category_products = Array.new()

    [1..10].each do |n|
      category_products.push(Product.new(category_id: @category.id, name: "Product #{n}" ))
    end

    @category_products = category_products
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Product 1/)
  end
end

