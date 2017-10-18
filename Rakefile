task :all do |t|
  puts 'running tests and creating output file'
  ruby 'test/incoming_order_test.rb'
  ruby 'test/orders_reader_test.rb'
  ruby 'test/orders_test.rb'
  ruby 'test/orders_writer_test.rb'
  ruby 'test/outgoing_order_test.rb'
  ruby 'lib/runner.rb'
end
