require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入登録' do
    context '新規購入できる場合' do
      it "すべての値が正しく入力されていれば保存できる" do
        expect(@purchase_record_shipping_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @purchase_record_shipping_address.building_name = ''
        expect(@purchase_record_shipping_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空である' do
        @purchase_record_shipping_address.post_code = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが-を含んでいない' do
        @purchase_record_shipping_address.post_code = '1234567'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'prefectureに「---」が選択されている場合' do
        @purchase_record_shipping_address.prefecture_id = 0
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空である' do
        @purchase_record_shipping_address.municipalities = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'street_addressが空である' do
        @purchase_record_shipping_address.street_address = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空である' do
        @purchase_record_shipping_address.phone_number = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが数字以外を含む' do
        @purchase_record_shipping_address.phone_number = 'abc500'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'phone_numberが10桁未満である' do
        @purchase_record_shipping_address.phone_number = '123456789'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it 'phone_numberが11桁より大きい' do
        @purchase_record_shipping_address.phone_number = '1234567891011'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'user_idが紐付いていなければ投稿できない' do
        @purchase_record_shipping_address.user_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      
      it 'item_idが紐付いていなければ投稿できない' do
        @purchase_record_shipping_address.item_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchase_record_shipping_address.token = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end