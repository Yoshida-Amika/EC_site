class Public::CustomersController < ApplicationController

before_action :authenticate_customer!



private

# def customers_params
    # params.require(:customers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  # end

end
