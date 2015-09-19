%w(user admin guest).each do |username|
  user = User.new(username: username, password: 'password', password_confirmation: 'password')
  user.save
  user.add_role(username.to_sym)
end

for post in 1..5
  post = Post.new(title: "Post #{post}", content: 'Lorem ipsum dolor sit amet', user_id: 1)
  post.save

  for comment in 1..5
    comment = post.comments.new(content: "Comment #{comment} to post #{post.title}", user_id: 1)
    comment.save
  end
end
