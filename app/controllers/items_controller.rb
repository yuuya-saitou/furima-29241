class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
    
  # end

  # def edit
    
  # end

  private

  def item_params
    params.require(:item).permit(:id, :image, :name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
end
