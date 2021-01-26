require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it "メッセージを書けば投稿できること" do
      expect(@comment).to be_valid
    end

    it "imageが空では登録できないこと" do
      @comment.message = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Message can't be blank")
    end
  end
end
