module FormHelper
 #  used with nested_form_for post
#   def setup_post(post, current_user)
#     groups = current_user.groups_as_owner + current_user.groups_as_member
#     (groups - post.groups).each do |group|
#       post.assignments.build(:group => group)
#     end
#     post.assignments.sort_by {|x| x.group.name }
# 
#     post_image = post.post_images.build
# 
#     post
#   end
  def setup_post(post, current_user)
    groups = current_user.groups_as_owner + current_user.groups_as_member
    (groups - post.groups).each do |group|
      post.assignments.build(:group => group)
    end
    post.assignments.sort_by {|x| x.group.name }
    post_image = post.post_images.build
    post
  end
end
