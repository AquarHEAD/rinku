require 'rubygems'
require 'bundler/setup'
require 'sequel'

DB = Sequel.postgres('rinku', :user => 'rinku', :password => 'rinku', :host => 'localhost')

DB.create_table :bookmarks do
  primary_key :id
  String :title, :null => false
  String :link, :null => false
  String :comment
  DateTime :added_at, :default => Time::now
  index :added_at
end
