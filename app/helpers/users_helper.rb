module UsersHelper
  def get_random_items
    return "joe" unless member_groups == true
    if member_groups == 1
      assignments = member_groups.assignments.limit(5)
      random_items = Post.rand_by_post(assignments)
    end
    random_groups = member_groups.sort_by{rand}.slice(0,5)
    random_items = Array.new
    i=0
    return "bob" unless random_groups.empty? == true
    until i == 10 do
      random_groups.each do |group|
        assignments = group.assignments.limit(5)
        if y = Post.rand_by_post(assignments)
          random_items << y
          i+=1
          if random_items == 5
            return random_items
          end
        else
          return random_items
        end
      end
    end
    
    return random_items
  end
end
