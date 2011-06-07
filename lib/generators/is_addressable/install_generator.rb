require 'rails/generators'
require 'rails/generators/migration'

module IsAddressable
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)
    desc 'Generates (but does not run) a migration to add an addresses table.'

    def self.next_migration_number(dirname) #:nodoc:
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

    def create_files
      migration_template 'create_addresses.rb', 'db/migrate/create_addresses.rb'
    end
  end
end
