require 'fileutils'
require_relative '../lib/post_builder'

class NewPost
  attr_accessor :title
  def initialize(title)
    self.title = title
  end

  def create
    FileUtils.touch("views/#{partial}.haml")
    add_post_to_config
    post_partial
  end

  def add_post_to_config
    File.open(File.expand_path('config/posts.yaml'), 'a') do |post|
      post.write(entry)
    end
  end

private

  def entry
a = <<EOF

--- !ruby/object:PostBuilder
post_id: #{next_post_id}
title: #{title}
tags:
author: Clare Lennon
featured: false
summary:
long_read: false
post_date: #{DateTime.now.strftime("%Y-%m-%d")}
link: '#{title_to_s}'
partial: '#{partial}'

EOF
  end

  def partial
   "partials/posts/#{title_to_s}"
  end

  def title_to_s
    title.gsub(/ /,"_").downcase
  end

  def post_partial
    File.open("views/#{partial}.haml", "w+") do |partial|
      partial.write("= partial('partials/shared/post_header', :post => post)\n\n\n= partial('partials/shared/post_footer', :post => post)")
    end
  end

  def next_post_id
    posts = PostBuilder.load_all_posts('./config/posts.yaml')
    PostBuilder.load_yaml(posts).map(&:post_id).sort.last + 1
  end
end