require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sequel'

DB = Sequel.postgres('rinku', :user => 'rinku', :password => 'rinku', :host => 'localhost')

get '/' do
  @bookmarks = DB[:bookmarks]
  @title = "Index"
  haml :index
end

post '/add/?' do
  @errors = []
  unless params[:title]
    @errors.push "Name cannot be empty"
  end
  unless params[:link]
    @errors.push "Link cannot be empty"
  end
  bks = DB[:bookmarks]
  bks.insert(title: params[:title], link: params[:link], comment: params[:comment])
  redirect '/'
end
