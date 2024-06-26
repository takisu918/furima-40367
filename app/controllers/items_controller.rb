class ItemsController < ApplicationController
  before_action :move_to_user_signed_in, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :check_purchase_record, only: [:edit]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
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

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to root_path unless @item.user == current_user
  end

  def check_purchase_record
    unless @item.purchase_record.nil?
      redirect_to root_path
    end
  end

end
