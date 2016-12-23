Technical test by VCODET

For the application :

* Set database.yml & environment.rb in ./config/ for your own environment (mysql required)
* I used RVM for running the application
* You may need to install new gems
* $rake db:init (or db:create then db:migrate), check the Rakefile for more informations. The created database has a long name (and customized) for avoiding conflicts (reminder_byVCODET)
You can tip db:reset once the db is initialised and you want to clean it
* $ruby launch.rb for running the application


For the tests:

* I use RVM as well, I did not set a database for test. 
* go to rootpath/tests/
* $ruby unit_test_customer.rb
* $ruby unit_test_reminder.rb

Vincent CODET