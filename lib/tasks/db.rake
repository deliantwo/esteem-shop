namespace :db do
  desc 'Make migration with output'
  task(:migrate_with_sql => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = Logger.new('/home/ubuntu/workspace/esteem/log/custom_log.log')
    Rake::Task['db:migrate'].invoke
  end
end