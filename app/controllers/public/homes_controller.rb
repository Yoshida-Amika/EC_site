class Public::HomesController < ApplicationController

  def index
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end

end
