# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
moderator = Moderator.create(
	fullname: "Kingsley Ijomah",
	username: "kingsley@example.com",
	password: "example")

30.times do
	post = Post.create(
		title: Faker::Lorem.sentence(20),
		content: Faker::Lorem.paragraph,
		publish: true,
		moderator: moderator)

	tag = Tag.create(name: Faker::Lorem.word)

	post_tag = PostTag.create(post: post, tag: tag)
end