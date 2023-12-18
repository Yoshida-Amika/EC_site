class Public::CustomersController < ApplicationController

before_action :authenticate_customer!



def edit
end

def show
    @customer = Customer.find(params[:id])
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


def updeta
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_my_page_path
end




private

def customers_params
    params.require(:customers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
end

end
