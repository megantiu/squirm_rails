namespace :db do
  namespace :functions do
    task :load => :environment do
      functions = File.read(Rails.root.join("db", "functions.sql"))
      result = ActiveRecord::Base.connection.execute functions
      result.clear
    end
  end

  namespace :schema do
    task :load do
      Rake::Task["db:functions:load"].invoke
    end
  end
end