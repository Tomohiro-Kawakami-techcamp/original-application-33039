require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全て記入すれば登録できること" do
      expect(@item).to be_valid
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "infoが空では登録できないこと" do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが全角数字であれば登録できないこと" do
      @item.price = "５００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが数字以外であれば登録できないこと" do
      @item.price = "abc"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが半角英数混合では登録できないこと" do
      @item.price = "10000ab"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "price_discriminationが空では登録できないこと" do
      @item.price_discrimination = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price discrimination can't be blank")
    end

    it "price_discriminationが全角数字であれば登録できないこと" do
      @item.price_discrimination = "５００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price discrimination Half-width number")
    end

    it "price_discriminationが数字以外であれば登録できないこと" do
      @item.price_discrimination = "abc"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price discrimination Half-width number")
    end

    it "price_discriminationが半角英数混合では登録できないこと" do
      @item.price_discrimination = "10000ab"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price discrimination Half-width number")
    end

    it "category_idが未選択であれば登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "delivery_idが未選択であれば登録できないこと" do
      @item.delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery Select")
    end
  end
end