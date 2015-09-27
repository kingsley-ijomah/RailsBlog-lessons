# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
moderator = Moderator.create(fullname: 'Kingsley', username: 'kingley@example.com', password: 'secret')
post = Post.create(title: 'Test title', content: 'Test content', publish: true, moderator: moderator)
tag = Tag.create(name: 'Test tag', status: true)
post_tag = PostTag.create(post: post, tag: tag)
visitor = Visitor.create(fullname: 'Test visitor', email: 'visitor@email.com', status: true)
comment = Comment.create([
	{message: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', status: true, post: post, visitor: visitor},
	{message: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', status: false, post: post, visitor: visitor}])
message = Message.create(content: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', visitor: visitor, status: false)