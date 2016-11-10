require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :product_id => "Product",
        :price => "9.99",
        :category => nil
      ),
      Product.create!(
        :name => "Name",
        :product_id => "Product",
        :price => "9.99",
        :category => nil
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    assert_select "tr>td", :text => "$9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
