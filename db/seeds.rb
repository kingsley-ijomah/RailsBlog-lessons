# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

500.times do
	moderator = Moderator.create(
		fullname: Faker::Name.name, 
		username: Faker::Internet.email, 
		password: Faker::Internet.password)

	post = Post.create(
		title: Faker::Lorem.sentence, 
		content: Faker::Lorem.paragraph, 
		publish: [true, false].sample, 
		moderator: moderator)

	tag = Tag.create(
		name: Faker::Company.suffix, 
		status: [true, false].sample)

	post_tag = PostTag.create(post: post, tag: tag)

	visitor = Visitor.create(
		fullname: Faker::Name.name, 
		email: Faker::Internet.email, 
		status: [true, false].sample)

	comment = Comment.create([
		{message: Faker::Lorem.sentence, 
			status: [true, false].sample, 
			post: post, 
			visitor: visitor
			},
		{message: Faker::Lorem.sentence, 
			status: [true, false].sample, 
			post: post, 
			visitor: visitor}
	])
	message = Message.create(
		content: Faker::Lorem.sentence, 
		visitor: visitor, 
		status: [true, false].sample)
end