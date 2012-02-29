require 'spec_helper'

describe "group_categories/edit" do
  before(:each) do
    @group_category = assign(:group_category, stub_model(GroupCategory,
      :name => "MyString"
    ))
  end

  it "renders the edit group_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => group_categories_path(@group_category), :method => "post" do
      assert_select "input#group_category_name", :name => "group_category[name]"
    end
  end
end
