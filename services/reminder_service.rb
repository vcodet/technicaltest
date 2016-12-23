require 'active_record'
require './controllers/reminder'
require './controllers/customer'

class ReminderService

	def add_reminder
		AddReminderService.new.add_reminder
	end

	def remove_reminder
		if Reminder.all.count > 0

	    reminders_list

    	puts("Enter ID of the reminder: ")
			id = Integer(gets.chomp)

			Reminder.find(id).delete

			listing true

			puts "Reminder deleted"
    else
    	puts ("No reminder found \n")
    end
	end
  
  def set_next_dates
  	Reminder.all.each do |reminder|
	    while reminder.due_date.past?
	    	puts reminder.due_date
	      case reminder.rule
		      when "Quaterly"
		      reminder.due_date = reminder.due_date.months_since(3)
		      when "Twice a year"
	        reminder.due_date = reminder.due_date.months_since(6)
	      end
	    	 reminder.save
	    end
    end
  end

  def listing incoming
  	ListReminderService.new.listing (incoming)
	end

	def reminders_list
  	if Reminder.all.count > 0
  		puts(" ID \t-\tCode\t- Applied rule\t- Next Due Date\n")
	    Reminder.all.each do |reminder|
	    	current_customer = Customer.find(reminder.customer_id)
	    	puts(" #{reminder.id}\t-   #{current_customer.estate_code}\t- #{reminder.rule}\t- #{reminder.due_date.strftime("%a, %d %b")}\n")
	  	end
    else
    	puts ("No reminder found \n")
    end
  end	

end