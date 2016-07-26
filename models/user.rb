class User < ActiveRecord::Base

  ## ASSOCIATIONS


  # BlogPost.any?
  # u.blog_posts.all # => [<BlogPost>, ...] || []
  has_many :blog_posts # blog_posts#user_id
end