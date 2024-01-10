class Public::CustomersController < ApplicationController

before_action :authenticate_customer!


def edit
    @customer = current_customer
    @customer = Customer.find(params[:id])
end

def update
    @customer = Customer.find(params[:id])
    @customer.update(customers_params)
    redirect_to customer_path
end


def show

    @customer = current_customer
end

def confirmation
    @customer = current_customer
end


def check
    @customer = Customer.find(params[:id])
end

def withdrawl
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
end


private



def customers_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
end

end
