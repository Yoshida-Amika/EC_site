class Public::HomesController < ApplicationController

  def index
    @items = Item.order('id DESC').limit(4)
    @customer = current_customer
  end

  def about
  end

end
