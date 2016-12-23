class ListReminderService

	def listing incoming
		@incoming = incoming

		if Reminder.all.count > 0
  		self.process
		else
			puts("No reminder found")
		end
	end

	def process 
		any_return = false

		if @incoming == false
			puts("Which is the range? (Value : Day)\n")
			typed = Integer(gets.chomp)
		else
			typed = 0;
		end

		puts(" Code\t- Applied rule\t- Next Due Date\n")
		Reminder.all.each do |reminder|
			any_return = false
	    current_customer = Customer.find(reminder.customer_id)
	    case reminder.rule
	    when "Quaterly"
	      if (reminder.due_date.months_ago(1) < Date.today.days_since(typed)) && (reminder.due_date > Date.today.days_since(typed))
	        reminder.who_am_i
	        any_return = true
	      end
	    when "Twice a year"
	      if (reminder.due_date.months_ago(2) < Date.today.days_since(typed)) && (reminder.due_date > Date.today.days_since(typed))
	        reminder.who_am_i
	        any_return = true
	      end
	    end
		end

		if any_return == false
      puts("***** No reminder scheduled *****")
    end
  end

end