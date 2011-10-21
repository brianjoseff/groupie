require 'spec_helper'

describe "emails/new.html.haml" do
  before(:each) do
    assign(:email, stub_model(Email,
      :subject => "MyString",
      :content => "MyText",
      :to => "MyString",
      :from => "MyString"
    ).as_new_record)
  end

  it "renders new email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => emails_path, :method => "post" do
      assert_select "input#email_subject", :name => "email[subject]"
      assert_select "textarea#email_content", :name => "email[content]"
      assert_select "input#email_to", :name => "email[to]"
      assert_select "input#email_from", :name => "email[from]"
    end
  end
end
