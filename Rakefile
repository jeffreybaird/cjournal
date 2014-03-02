require "./app"
require "sinatra/activerecord/rake"
require_relative 'utils/new_post'

desc "Creates a new post"
task :new_post, :title do |t, args|
  puts args[:title]
  NewPost.new(args[:title]).create
end

desc "Resets all posts"
task :reset_posts do |t|
  Post.reset
end

desc "reset and load posts for deploy"
task :load_posts do |t|
  Post.reset
  PostBuilder.save_posts_to_db
end
