class Assignment < ActiveRecord::Base
  belongs_to :post
  belongs_to :group
end
