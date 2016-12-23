class ConsoleService

	def show_commands
		puts "1- Add a reminder"
		puts "2- Add a customer"
		puts "3- Reminder for the next X days (X defined by the user)"
		puts "4- List all reminders"
		puts "5- List all customers"
		puts "6- Remove a reminder"
		puts "7- Remove a customers"
		puts "0- Exit"
	end
	
	def listing
		if Reminder.all.count > 0
			puts(" ID \t - Code\n")
			Reminder.all.each do |reminder|
				reminder.date_displayed
			end
		else
			puts("No reminder found \n")
		end
	end

end