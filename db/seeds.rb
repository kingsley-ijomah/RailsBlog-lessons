# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do
	moderator = Moderator.create(
		fullname: Faker::Name.name, 
		username: Faker::Internet.email, 
		password: Faker::Internet.password,
		global: false)

	post = Post.create(
		title: Faker::Lorem.sentence, 
		content: Faker::Lorem.paragraph, 
		publish: true, 
		moderator: moderator)

	tag = Tag.create(
		name: Faker::Company.suffix)

	post_tag = PostTag.create(post: post, tag: tag)

	visitor = Visitor.create(
		fullname: Faker::Name.name, 
		email: Faker::Internet.email)

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

	notifiable = [comment[0], visitor].sample
	notifiable_type = notifiable.class.name

	notification = Notification.create(
		notifiable_id: notifiable.id,
		notifiable_type: notifiable_type)
end

# global moderator
Moderator.create(
	fullname: "Kingsley Ijomah", 
	username: "kingsley@example.com", 
	password: "example",
	global: true)

# only one record should ever exist
Setting.create(
	site_name: Faker::Company.name,
	post_per_page: 20,
	under_maintenance: false,
	prevent_commenting: false,
	tag_visibility: true)