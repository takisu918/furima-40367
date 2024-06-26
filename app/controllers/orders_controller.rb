class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
  end

  def create
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(order_params)
    if @purchase_record_shipping_address.valid? 
      pay_item
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id]) # 追加
  end

  def order_params
    params.require(:purchase_record_shipping_address).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def redirect_if_seller
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end