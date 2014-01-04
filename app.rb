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

    #database
    set :database, "sqlite3:///cjournal.db"

    #filters

    #routes
    get '/' do
      haml :index
    end

    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
