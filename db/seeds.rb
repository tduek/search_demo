User.delete_all
Post.delete_all

200.times do |i|
  user = User.create(name: "User ##{ i + 1 }")

  400.times do |j|
    user.posts.create(
      title: user.name,
      body:  "Ooooh! Check out my body! btw, this is body ##{ (i * 100) + j }"
    )
  end
end

me = User.create(name: "tommy duek")
me.posts.create(title: "tommy's first title", body: "check out my awesome body! by tommy")

