class ItemsController < ApplicationController

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
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
    params.require(:item).permit(:name, :user_id)
  end
end
