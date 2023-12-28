class Public::HomesController < ApplicationController

  def index
    @customer = current_customer
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end

end
