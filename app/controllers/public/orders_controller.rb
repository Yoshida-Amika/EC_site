class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @customer = current_customer
    @order = Order.new
    #@address = Address.all

  end

  def index
    @customer = current_customer
  end

  def show
    @customer = current_customer
  end
  
  def thanks
    @customer = current_customer
  end
  
    

end

