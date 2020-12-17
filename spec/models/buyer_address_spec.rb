require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '郵便番号、都道府県、市区町村、番地、TEL、user_id、item_idが存在すれば購入できる' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @buyer_address.building_name = nil
        expect(@buyer_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'post_codeが空だと購入できない' do
        @buyer_address.post_code = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @buyer_address.post_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと購入できない' do
        @buyer_address.prefecture_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idの値が1であれば購入できない' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと購入できない' do
        @buyer_address.city = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @buyer_address.address = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @buyer_address.phone_number = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以内でないと購入できない' do
        @buyer_address.phone_number = '000000000000'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalud. Only 11th digits')
      end
      it 'phone_numberが半角英語だと購入できない' do
        @buyer_address.phone_number = 'aaaaaaaaaaa'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalud. Only 11th digits')
      end
      it 'phone_numberが半角英数混合だと購入できない' do
        @buyer_address.phone_number = 'aaaaaa00000'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalud. Only 11th digits')
      end
      it 'tokenが空では購入できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できないこと' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できないこと' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
