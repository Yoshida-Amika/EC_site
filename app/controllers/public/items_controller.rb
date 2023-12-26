class Public::ItemsController < ApplicationController

  def index
   @item = Item.all
   @customer = current_customer
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
    if my_cart.add_item(product_id: params[:item_id], quantity: params[:quantity])
       item.save
       redirect_to cart_items_path(@cart.id)
      # カートアイテムの追加に成功した時の処理
    else
      # 失敗した時の処理
    end
  end

   def set_cart
    @cart = current_cart
   end


  private

    def item_params
      params.require(:item).permit(:image, :name, :introduction, :price)
    end


end

