# Technical test by VCODET
## Setup
* Set database.yml & environment.rb in ./config/ for your own environment (mysql is required)

##  The application :


* I used RVM for running the application
* You may need to install new gems
* Run the following command
```
* rake db:init
```
 
* You can type the next command to clean it (once the database is up)
```
rake db:reset
```
* How to run the application
```
ruby launch.rb
```




## For the tests:

* I use RVM as well for the tests
* go to path/Reminder/tests/

```shell
$ ruby unit_test_customer.rb
```

```shell
$ ruby unit_test_reminder.rb
```


Vincent CODET