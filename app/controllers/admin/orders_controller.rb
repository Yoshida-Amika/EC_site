class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
     @order = Order.find(params[:id])
     @total = 0
     @postage = 800
  end




end
