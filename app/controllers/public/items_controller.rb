class Public::ItemsController < ApplicationController

  def index
   @item = Item.all
   @customer = current_customer
  end

  def show
    @customer = current_customer
  end


  private

    def item_params
      params.require(:item).permit(:image, :name, :introduction, :price)
    end


end

