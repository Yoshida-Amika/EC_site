class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!
  before_action :in_cart_item_chack, only:[:new, :create]

  def new
    @customer = current_customer
    @order = Order.new


  end

  def index
    @customer = current_customer
    @order = current_customer.orders
    @total = 0
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @customer = current_customer
    @total = 0
    @postage = 800

  end

  def thanks
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @customer = current_customer
    @cart_items = current_customer.cart_items
    @payment_method = params[:order][:payment_method]
    @total = 0
    @postage = 800
  end

  def create
     @order = Order.new(order_params)
     @order.save
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.order_id = @order.id
        @order_detail.amount = cart_item.amount
        @order_detail.purchase_price = (cart_item.item.price*1.1).floor
        @order_detail.save
      end
      current_customer.cart_items.destroy_all

      redirect_to thanks_path

  end

  private

    def order_params
      params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :addressee, :payment_amount, :postage)
    end

    def in_cart_item_chack
      @cart_items = current_customer.cart_items
      unless @cart_items.present?
        redirect_to  cart_items_path
      end
    end

end

