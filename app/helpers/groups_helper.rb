module GroupsHelper
  def truncate(words, limit)
    string_arr = words.split(' ')
    string_arr.count > limit ? "#{string_arr[0..(limit-1)].join(' ')}..." : words
  end
end
