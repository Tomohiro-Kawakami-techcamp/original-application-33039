require 'rails_helper'

RSpec.describe Service, type: :model do
  describe '#create' do
    before do
      @service = FactoryBot.build(:service)
    end

    it "全て記入すればサービスできること" do
      expect(@service).to be_valid
    end

    it "内容が空ではサービスできないこと" do
      @service.content = nil
      @service.valid?
      expect(@service.errors.full_messages).to include("Content can't be blank")
    end

    it "申込期限が空だとサービスできないこと" do
      @service.limit_day = nil
      @service.valid?
      expect(@service.errors.full_messages).to include("Limit day can't be blank")
    end

    it "申込期限の書き方が違うとサービスできないこと" do
      @service.limit_day = "2021/02/05"
      @service.valid?
      expect(@service.errors.full_messages).to include("Limit day input correctly")
    end

    it "対象者が空だとサービスできないこと" do
      @service.target = nil
      @service.valid?
      expect(@service.errors.full_messages).to include("Target can't be blank")
    end

    it "発表日が空ではサービスできないこと" do
      @service.release_day = nil
      @service.valid?
      expect(@service.errors.full_messages).to include("Release day can't be blank")
    end

    it "発表日が空ではサービスできないこと" do
      @service.release_day = "2021/02/05"
      @service.valid?
      expect(@service.errors.full_messages).to include("Release day input correctly")
    end
  end
end
