require 'spec_helper'

describe "group_categories/index" do
  before(:each) do
    assign(:group_categories, [
      stub_model(GroupCategory,
        :name => "Name"
      ),
      stub_model(GroupCategory,
        :name => "Name"
      )
    ])
  end

  it "renders a list of group_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
