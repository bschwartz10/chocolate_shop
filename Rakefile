task :all do
  puts 'running tests and creating redemptions file'
  ruby 'test/orders_reader_test.rb'
  ruby 'test/order_test.rb'
  ruby 'test/orders_writer_test.rb'
  ruby 'lib/runner.rb'
end

task :tests do
  puts 'running tests'
  ruby 'test/orders_reader_test.rb'
  ruby 'test/order_test.rb'
  ruby 'test/orders_writer_test.rb'
end

task :redemptions do
  puts 'creating redemptions file'
  ruby 'lib/runner.rb'
end
