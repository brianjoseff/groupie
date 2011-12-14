require 'spec_helper'

describe "product_categories/new.html.haml" do
  before(:each) do
    assign(:product_category, stub_model(ProductCategory,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new product_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_categories_path, :method => "post" do
      assert_select "input#product_category_name", :name => "product_category[name]"
    end
  end
end
