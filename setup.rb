require 'pry' # in case you want to use binding.pry
require 'active_record'

# Load all models here
require_relative './models/blog_post'
require_relative './models/user'

# Output messages from Active Record to standard out
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'w6d2example',
  # username: 'development',
  # password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'

ActiveRecord::Schema.define do
  drop_table :blog_posts if ActiveRecord::Base.connection.table_exists?(:blog_posts)
  drop_table :users if ActiveRecord::Base.connection.table_exists?(:users)
  create_table :blog_posts do |t|
    t.string :title
    t.text :content
    # t.integer :user_id
    t.references :user
    t.timestamps null: false
  end
  create_table :users do |t|
    t.string :username
    t.boolean :active, default: true
    t.timestamps null: false
  end
end

puts 'Setup DONE'
