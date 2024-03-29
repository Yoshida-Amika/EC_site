class Admin::CustomersController < ApplicationController

before_action :authenticate_admin!

def index
  @customer = Customer.all
  @customers = Customer.where(status: :resigned)
  
end

def show
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
end

def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path
end

 private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
    end


end
