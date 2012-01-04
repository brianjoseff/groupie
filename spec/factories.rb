Factory.define :user do |f|
  f.sequence(:name) { |n| "brian" }
  f.sequence(:email) { |n| "foo#{n}@example.edu" }
  f.password "secret"
end

# Factory.define :post do |f|
#   f.sequence(:name){|n| "thing"}
#   f.sequence(:description){|n| "it is a cool thing"}
#   f.sequence(:owner){|n| "thing"}
#   f.sequence(:name){|n| "thing"}
#   f.sequence(:name){|n| "thing"}
#   
# end
