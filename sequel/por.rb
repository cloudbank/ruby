require 'sidekiq'
require_relative 'sequel_test'

# If your client is single-threaded, we just need a single connection in our Redis connection pool
Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'x', :size => 1, :url => 'redis://127.0.01:6379' }
end

# Sidekiq server is multi-threaded so our Redis connection pool size defaults to concurrency (-c)
Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'x', :url => 'redis://127.0.01:6379' }
end

# Start up sidekiq via
# ./bin/sidekiq -r ./examples/por.rb
# and then you can open up an IRB session like so:
# irb -r ./examples/por.rb
# where you can then say
# PlainOldRuby.perform_async "like a dog", 3
#
class PlainOldRuby
  include Sidekiq::Worker

  def perform(how_hard="super hard", how_long=1)
    sleep how_long
    item = Item.insert(:name => 'lo mein', :price => rand * 100)
    puts item
    puts "Workin' #{how_hard}"
  end
end


 PlainOldRuby.perform_async "like a dog", 3