require 'active_record'

class Reminder < ActiveRecord::Base

	def new
		reminder = Reminder.new
	end

	def add id_input, rule_input, date_input
    accurate_data = true 

    accurate_data = self.controlle_id_customer id_input
    unless accurate_data == false
      accurate_data = self.controlle_rule rule_input
    end
    unless accurate_data == false
      accurate_data = self.controlle_date date_input
    end

    if accurate_data == true 
      self.save 
      return true
    else
      return false
    end
    
	end

  def who_am_i
    current_customer = Customer.find(self.customer_id)
    puts "#{current_customer.estate_code}\t- #{self.rule}\t- #{self.due_date.strftime("%a, %d %b")}\n"
  end

  def controlle_id_customer id_input
    unless id_input.nil? or (Customer.exists?(id_input) == false)
      self.customer_id = id_input
      return true
    else
      return false
    end
  end

  def controlle_rule rule_input
    unless rule_input.nil? or ((rule_input != "Quaterly") and (rule_input != "Twice a year"))
      self.rule = rule_input
      return true
    else
      return false
    end
  end

  def controlle_date date_input
    unless date_input.nil? or date_input.past? == true
      self.due_date = date_input
      return true
    else
      return false
    end
  end
end