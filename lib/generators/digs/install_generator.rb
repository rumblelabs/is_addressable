require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record/migration'

module Digs
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    extend ActiveRecord::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    desc 'Generates (but does not run) a migration to add an addresses table.'

    def create_files
      migration_template 'create_addresses.rb', 'db/migrate/create_addresses.rb'
      copy_file "address.rb", "app/models/address.rb"
    end
  end
end
