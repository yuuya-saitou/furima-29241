class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create] 
  before_action :move_to_root

  def index
    @order = Order.new
  end

  def create
    @order = BuyerOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    unless user_signed_in?
      redirect_to root_path
      return
    end
    if @item.buyer != nil || current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
