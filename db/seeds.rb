require 'faker'

# Create Posts
50.times do
  Post.create!(
  	title: Faker::Lorem.sentence,
  	body: Faker::Lorem.paragraph
  	)
end
posts = Post.all

# Create Comments
100.times do 
  Comment.create!(
  	post: posts.sample,
  	body: Faker::Lorem.paragraph
  	)
end


#Post.find_or_create_by(title: "UNIQUE TITLE", body: "UNIQUE BODY")

#Comment.find_or_create_by{post_id: Post.find_or_create_by(title: "UNIQUE TITLE", body: This is my comment!)}

#Comment.find_or_create_by(post_id: "UNIQUE TITLE", body: This is my comment!)

puts "#{Post.count}"
Post.find_or_create_by(
  title: "This is the unique post!",
  body: "This is where I would put the info about this!"
)
puts "#{Post.count}"

puts "#{Comment.count}"
Comment.find_or_create_by(
  post_id: Post.find_by(title: "This is the unique post!", body: "Lot's of comments!"),
  body: "This is extra!"
)
puts "#{Comment.count}"


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"