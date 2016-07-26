require 'active_record'
require 'pg'
require 'activerecord-postgis-adapter'
require 'logger'

ActiveRecord::Base.logger = Logger.new('log/debug.log')
configuration = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(configuration['development'])
