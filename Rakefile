namespace :test do
  desc 'Runs all unit tests'
  task :units do
    Dir.glob(File.join(File.dirname(__FILE__), '**', '*_test.rb')).each{ |filename| require filename } 
  end
end