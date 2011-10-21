require 'spec_helper'

describe User do

  
  describe "#get_some_random_items" do 
    let(:user) { Factory(:user) }
    let(:group) { user.groups_as_members }
    it "returns if groups is nil" do
      user.get_some_random_items(group)
    end
    
    it "calls for each group rand_by_post and puts it in array" do
      
    end
      
    context 'if groups parameter is empty'
    context 'if groups parameter has stuff'
  end  
end
