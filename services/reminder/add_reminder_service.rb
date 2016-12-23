class AddReminderService

	def add_reminder
		if Customer.all.count > 0

			customer_id = self.code_form
			rule = self.rule_form
      dute_date = self.date_form

      Reminder.new.add(customer_id ,rule , dute_date)

      ListReminderService.new.listing true

      puts "Reminder Added"

    else
      puts("No customer found, please enter one before adding a reminder")
    end
		
	end

	def code_form
		CustomerService.new.customers_list
		customer_found = false
		while customer_found == false
		  print("Enter id of the customer: ")
      customer_id = Integer(gets.chomp)
      if Customer.exists?(customer_id)
      	customer_found = true
      end
    end

    return customer_id

  end

  def rule_form
  	rule = ""
  	while rule == ""
  	  puts("1- Quaterly paiement")
      puts("2- Twice a year")
      print("The applied rule: ")
      
      typed = Integer(gets.chomp)

      case typed
      when 1
        rule = "Quaterly"
      when 2
        rule = "Twice a year"
      end
    end

    return rule
  end


	def date_form
		date_given = Date.new
		begin
			while date_given.past? == true
		    print("When is the first due date? (DD-MM-YYYY): ")
		    date_given = gets.chomp
		    date_given = date_given.split('-')
		    date_given = Date.new(Integer(date_given[2]), Integer(date_given[1]), Integer(date_given[0])) 
	   	end
		 	return date_given
	  rescue Exception => e
	  	puts "Please follow the instructions"
			puts e
			date_form
	   	
	 	end
	end

end