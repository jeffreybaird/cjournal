require_relative 'spec_helper'

require 'post_builder'
require 'post'

describe PostBuilder do
  include Helpers
let(:config_file){
  Helpers.config_file
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