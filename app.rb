require 'bundler'

Bundler.require

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
      @posts = featured_posts
      p @posts.map {|x| x.title}
      haml :index
    end

    #helpers
    helpers do
      def partial(file_name)
        haml file_name.to_sym, :layout => false
      end

      def featured_posts
        Post.where(:featured => true)
      end
    end

  end
end
