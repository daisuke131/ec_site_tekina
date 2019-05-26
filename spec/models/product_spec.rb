require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "varidates presence" do
    let(:current_user) { create(:user) }
    let(:category) { create(:category) }

    context "全カラムを指定しているとき" do
      let(:product) { create(:product, user_id: current_user.id, category_id: category.id)}

      it "レコードが作成される" do
        expect(product).to be_valid
      end

      it "出品したユーザーidが保存される" do
        expect(product.user_id).to eq current_user.id
      end

      it "登録したカテゴリーidが保存される" do
        expect(product.category_id).to eq category.id
      end
    end

    context "nameが指定されていないとき" do
      let(:product) { build(:product, name: nil, user_id: current_user.id, category_id: category.id)}

      it "エラーになる" do
        product.valid?
        expect(product.errors.messages[:name]).to include "を入力してください"
      end
    end

    context "nameが指定されていないとき" do
      let(:product) { build(:product, name: nil, user_id: current_user.id, category_id: category.id)}

      it "エラーになる" do
        product.valid?
        expect(product.errors.messages[:name]).to include "を入力してください"
      end
    end

    context "descriptionが指定されていないとき" do
      let(:product) { build(:product, description: nil, user_id: current_user.id, category_id: category.id)}

      it "エラーになる" do
        product.valid?
        expect(product.errors.messages[:description]).to include "を入力してください"
      end
    end

    context "priceが指定されていないとき" do
      let(:product) { build(:product, price: nil, user_id: current_user.id, category_id: category.id)}

      it "エラーになる" do
        product.valid?
        expect(product.errors.messages[:price]).to include "を入力してください"
      end
    end

    context "image1が指定されていないとき" do
      let(:product) { build(:product, image1: nil, user_id: current_user.id, category_id: category.id)}

      it "エラーになる" do
        product.valid?
        expect(product.errors.messages[:image1]).to include "を入力してください"
      end
    end
  end
end
