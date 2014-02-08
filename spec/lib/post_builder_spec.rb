require_relative 'spec_helper'

require 'post_builder'
require 'post'

describe PostBuilder do
let(:config_file){
  a = <<EOF
--- !ruby/object:PostBuilder
post_id: 1
title: Fast
tags:
author:
featured: true
summary:
long_read:
post_date: 2014-01-10
link: "fast"
partial: "partials/posts/test_post"

--- !ruby/object:PostBuilder
post_id: 2
title: Fast
tags:
author:
featured: true
summary:
long_read:
post_date: 2014-01-10
link: "fast"
partial: "partials/posts/test_post"
EOF
}
  context "load_all_posts" do

    it "Loads all posts from the config flie" do
      file = Tempfile.new('config')
      file.write(config_file)
      file.read.split("\n\n")
      expect(PostBuilder.load_all_posts(file.path).size).to eq(2)
      file.close
      file.unlink
    end

  end

  context "load_yaml" do

    it "Loads a config file and turns them into PostBuilder objects" do
      file = Tempfile.new('config')
      file.write(config_file)
      file.read.split("\n\n")
      posts = PostBuilder.load_all_posts(file.path)
      expect(PostBuilder.load_yaml(posts).map(&:class).uniq).to eq([PostBuilder])
      file.close
      file.unlink
    end

  end

end