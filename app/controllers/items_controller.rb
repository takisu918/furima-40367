class ItemsController < ApplicationController
  before_action :move_to_user_signed_in, only: [:new]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to root_path
    end
  end
  
  def update
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to root_path
      return
    end
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_payer_id, :prefecture_id, :days_until_shipping_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_user_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
