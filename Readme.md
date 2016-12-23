For the application :

1/ Set database.yml & environment.rb in ./config/ for your own environment (mysql required)
2/ I used RVM for running the application
3/ You may need to install new gems
4/ $rake db:init (or db:create then db:migrate), check the Rakefile for more informations. The created database has a long name (and customized) for avoiding conflicts (reminder_byVCODET)
You can tip db:reset once the db is initialised and you want to clean it
5/ $ruby launch.rb for running the application


For the tests:

1/ I use RVM as well, I did not set a database for test. 
2/ go to rootpath/tests/
3/ $ruby unit_test_customer.rb
4/ $ruby unit_test_reminder.rb

Vincent CODET