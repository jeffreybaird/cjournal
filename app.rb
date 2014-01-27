require 'bundler'
require "sinatra"
require "rake"
require "haml"
require "active_record"
require "pg"
require 'protected_attributes'
require 'capistrano'
require 'yaml'
require './config/environments'

Dir.glob('./lib/*.rb') do |model|
  require model
end


module Cjournal

  class App < Sinatra::Application
    require 'sass/plugin/rack'
    use Sass::Plugin::Rack

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    #filters

    #routes
    get '/' do
      @posts = blog_posts
      haml :index
    end

    def self.posts
      posts = []
      $/="\n\n"
      File.open("./config/posts.yaml", "r").each do |post|
        posts << YAML::load(post)
      end
      posts.sort_by{|post| post.post_date}.reverse
    end

    posts.each do |post|
      get "/#{post.to_s}" do
        @post = post
        haml :post_view
      end
    end
    #helpers
    helpers do
      def partial(file_name, locals={})
        haml file_name.to_sym, :layout => false, :locals => locals
      end

      def blog_posts
        posts = []
        $/="\n\n"
        File.open("./config/posts.yaml", "r").each do |post|
          posts << YAML::load(post)
        end
        posts.sort_by{|post| post.post_date}.reverse
      end

      def link_to(url,text=nil,opts={})
        if text.is_a?(Hash)
          opts = text
          text = nil
        end
        attributes = ""
        opts.each { |key,value| attributes << key.to_s << "=\"" << value << "\" "}
        "<a href=\"#{url}\" #{attributes}>#{text}</a>"
      end

    end

  end
end
