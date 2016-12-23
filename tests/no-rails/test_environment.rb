require 'test/unit'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql2',
  :database => 'reminder_byVCODET',
  :username => 'root',
  :password => 'toor',
  :host     => 'localhost')