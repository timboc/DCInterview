require 'rails_helper'

RSpec.describe "start/index", type: :view do
  it "renders import link" do
    render
    expect(rendered).to have_content "Trigger Import"
  end
end
