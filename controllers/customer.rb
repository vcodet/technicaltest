require 'active_record'

class Customer < ActiveRecord::Base
  #Next line should be in the model,quicker to do this way (in this project only)
  validates :estate_code, length: { is: 6 }

	def new
		customer = Customer.new
	end

  def add society, estate_code
    accurate_data = true

    accurate_data = self.controlle_code(estate_code)
    
    unless accurate_data == false
      accurate_data = self.controlle_society(society)
    end

    if accurate_data == true 
      self.save
      return true
    else
      return false
    end

  end

  def controlle_code estate_code
    unless estate_code.nil? or estate_code.length != 6
      self.estate_code = estate_code
      return true
    else
      return false
    end
  end

  def controlle_society society
    unless society.nil?
      self.society = society
      return true
    else
      return false
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:society, :estate_code)
    end
end
