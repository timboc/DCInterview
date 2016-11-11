require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    category = Category.new(name: "theCategory")
    assign(:products, Kaminari.paginate_array([
      Product.create!(
        :name => "Name",
        :product_id => "Product",
        :price => "9.99",
        :category => category
      ),
      Product.create!(
        :name => "Name",
        :product_id => "Product",
        :price => "9.99",
        :category => category
      )
    ]).page.per(1))
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "Product".to_s, :count => 1
    assert_select "tr>td", :text => "$9.99".to_s, :count => 1
    assert_select "tr>td", :text => "theCategory".to_s, :count => 1
  end
end
