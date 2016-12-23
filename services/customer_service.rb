require 'active_record'
require './controllers/customer'

class CustomerService

	def add_customer
		printf("New customer's name: ")
		society = gets.chomp

		code = ""
		while code.length != 6
			printf("New customer's code (6 char): ")
			code = gets.chomp
		end		

		Customer.new.add(society, code)
		puts "Customer added"
	end

	def destroy(id)
		Customer.find(id).delete
		puts "Customer deleted"
	end
	
	def customers_list
		if Customer.all.count > 0
			puts(" ID \t-\tCode \t- Customer Name\n")
	    Customer.all.each do |customer|
	      puts(" #{customer.id}\t-   #{customer.estate_code}\t- #{customer.society}\n")
	    end
    else
    	puts ("No customer found \n")
    end
  end

  def remove_customer
		if Customer.all.count > 0
			customers_list

    	printf("Enter ID of the customer: ")
			id = gets.chomp

			Reminder.find_by_costumer_id(id).delete
			Customer.find(id).delete

			puts "Costumer deleted"

    else
    	puts ("No customer found \n")
    end
	end

end
