threads_count = 1
threads threads_count, threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "production" }
workers 1

preload_app!

on_worker_boot do
  @sidekiq_pid ||= spawn('bundle exec sidekiq -t 1')
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

on_restart do
  Sidekiq.redis.shutdown { |conn| conn.close }
end

plugin :tmp_restart
