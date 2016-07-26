require_relative './setup'

puts "In app.rb"

## CREATION (create, new, and save)

puts "CREATION Examples"

user = User.create username: 'kvirani'

## WITHOUT belongs_to ASSOCIATION

# Create a blog post and pass the user id
# This does not require an association (belongs_to :user) defined on BlogPost
bp = BlogPost.create(
  title: 'Hello World',
  content: 'I\'m Alive!'
  user_id: user.id
)

## WITH ASSOCIATION

# A cleaner way of creating a blog post is just through the relationship on User
# The `has_many :blog_posts` on User means on an instance of User I can call `blog_posts`

bp = user.blog_posts.create(
  title: 'Hello World',
  content: 'I\'m Alive!'
)

### Same outcome but written in multiple steps (create = new + save + return self)

bp = user.blog_posts.new(
  title: 'Hello World 2',
  content: 'I\'m Alive 2!'
)

bp.persisted? # => false
bp.id         # => nil (not in the db yet so doesn't have an id)
bp.save       # => true (saved successfully)
bp.persisted? # => true (saved now!)

## VALIDATIONS

puts "VALIDATION Examples"

# Note how BlogPost has a bunch of validations (requires presence of user and title)

# blog without title will not save (create or update)
bp = user.blog_posts.new(
  content: 'I\'m Alive 2!'
)

bp.title # => nil
bp.save  # => false (could not save!)
# why?
puts bp.errors.inspect # => array of error messages

bp.title = "Valid title here"

bp.save  # => true (does the CREATE!)


