require "./controllers/command"
require "./config/environment"
require 'active_record'

command = Command.new
command.check_dates
command.listing 
typed = -1

while typed.to_i != 0 do
	command.show_commands
	typed = Integer(gets)

	begin
		
	case Integer(typed)
		when 1
			command.add_reminder
		when 2
			command.add_customer
		when 3
			command.incoming_listing
		when 4
			command.reminders_list
		when 5
			command.customers_list
		when 6
			command.remove_reminder
		when 7
			command.remove_customer
		when 0
			puts "Exiting..."
		else
			puts "Command not found"
		end

	rescue Exception => e

		puts "Please follow the instructions"
		puts e
		typed = -1

	end

end
