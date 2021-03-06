require 'bundler'
require "sinatra"
require "rake"
require "haml"
require "active_record"
require "pg"
require 'protected_attributes'
require 'capistrano'
require 'yaml'
require_relative 'utils/fixnum'
require './config/environments'


configure { set :server, :puma }

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
        @posts = Post.all.sort_by{|p| p.post_date }.reverse
        haml :index
      end

      get '/resume.?:format?' do
        if params[:format] == 'pdf' || ENV['RACK_ENV'] == 'production'
          send_file 'public/img/resume.pdf'
        end
        haml :resume
      end

      get '/feed.xml' do
        @posts = Post.all.sort_by{|p| p.post_date }.reverse
        builder :feed
      end

      get '/post/:link' do
        @post = Post.where(:link => "post/#{params[:link]}").first
        haml :post_view
      end



     #helpers
      helpers do
        def partial(file_name, locals={})
          haml file_name.to_sym, :layout => false, :locals => locals
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
