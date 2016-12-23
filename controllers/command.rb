require "./services/console_service"
require "./services/customer_service"
require "./services/reminder_service"
require "./services/reminder/add_reminder_service"
require "./services/reminder/list_reminder_service"

class Command

	def new
		@console = Command.new
	end

	def check_dates
		ReminderService.new.set_next_dates
	end

	def listing
		ReminderService.new.listing true
	end

	def add_reminder
		ReminderService.new.add_reminder
	end
 
	def add_customer
		CustomerService.new.add_customer
	end

	def incoming_listing
		ReminderService.new.listing false
	end

	def remove_reminder
		ReminderService.new.remove_reminder
	end

	def remove_customer
		CustomerService.new.remove_customer
	end

	def show_commands
		ConsoleService.new.show_commands
	end

	def customers_list
		CustomerService.new.customers_list
  end

  def reminders_list
  	ReminderService.new.reminders_list
  end
end