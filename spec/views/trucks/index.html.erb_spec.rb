require 'rails_helper'

RSpec.describe "trucks/index", type: :view do
  before(:each) do
    assign(:trucks, [
      Truck.create!(),
      Truck.create!()
    ])
  end

  it "renders a list of trucks" do
    render
    expect(2).to be(3)
  end
end
