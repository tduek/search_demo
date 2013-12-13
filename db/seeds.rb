User.delete_all
Post.delete_all

20.times do |i|
  user = User.create(name: "User ##{ i + 1 }")

  10.times do |j|
    user.posts.create(
      title: user.name,
      body:  "Ooooh! Check out my body! btw, this is body ##{ (i * 20) + j }"
    )
  end
end
