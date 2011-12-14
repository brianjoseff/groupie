require 'spec_helper'

describe "product_categories/edit.html.haml" do
  before(:each) do
    @product_category = assign(:product_category, stub_model(ProductCategory,
      :name => "MyString"
    ))
  end

  it "renders the edit product_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_categories_path(@product_category), :method => "post" do
      assert_select "input#product_category_name", :name => "product_category[name]"
    end
  end
end
