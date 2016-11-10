require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name",
      :product_id => "Product",
      :price => "9.99",
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Product/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
