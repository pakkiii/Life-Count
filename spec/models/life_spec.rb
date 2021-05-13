require 'rails_helper'

RSpec.describe Life, type: :model do
  before do
    @life = FactoryBot.build(:life)
  end

  describe "投稿機能" do

    context '正常系' do
      it '全ての情報が指定された内容通り存在すれば登録できる' do
        expect(@life).to be_valid
      end
    end

    context '異常系' do
      it 'bad_thing（現状の辛いことを文章で)が入力されていなければ投稿できない' do
        @life.bad_thing = ''
        @life.valid?
        expect(@life.errors.full_messages).to include("Bad thing can't be blank")
      end

      it 'hope(今の状況で感謝できること)が入力されていないと投稿できない' do
        @life.hope = ''
        @life.valid?
        expect(@life.errors.full_messages).to include("Hope can't be blank")
      end

      it 'how_long_id(あなたのライフはあといくつ？)が選択されていないと投稿できない' do
        @life.how_long_id = 1
        @life.valid?
        expect(@life.errors.full_messages).to include("How long must be other than 1")
      end
    
      it 'tired_id(しんどいカテゴリー)が選択されていないと投稿できない' do
        @life.tired_id = 1
        @life.valid?
        expect(@life.errors.full_messages).to include("Tired must be other than 1")
      end

      it 'want_id(今何がしたいか)が選択されていないと投稿できない' do
        @life.want_id = 1
        @life.valid?
        expect(@life.errors.full_messages).to include("Want must be other than 1")
      end

      it 'month_id(今の季節)が選択されていないと投稿できない' do
        @life.month_id = 1
        @life.valid?
        expect(@life.errors.full_messages).to include("Month must be other than 1")
      end

      

    end
  end
end
