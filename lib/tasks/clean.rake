namespace :clean do
  desc "Clean PG"

  task :all => [
    :wipe,
    "db:seed"
  ]

  task :wipe => :environment do
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE") unless table == "schema_migrations"
    end
  end
end
