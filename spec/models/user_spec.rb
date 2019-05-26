require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validates presence" do
    context "全カラムの値を指定しているとき" do
      let(:user) { create(:user) }

      it "userのレコードが作成される" do
        expect(user).to be_valid
      end
    end

    context "nameを指定していないとき" do
      let(:user) { build(:user, name: nil) }
      it "エラーになる" do
        user.valid?
        expect(user.errors.full_messages_for(:name)).to include "ユーザーネームを入力してください"
      end
    end

    context "emailを指定していないとき" do
      let(:user) { build(:user, email: nil) }

      it "エラーになる" do
        user.valid?
        expect(user.errors.full_messages_for(:email)).to include "Eメールを入力してください"
      end
    end

    context "passwordを指定していないとき" do
      let(:user) { build(:user, password: nil) }

      it "エラーになる" do
        user.valid?
        expect(user.errors.full_messages_for(:password)).to include "パスワードを入力してください"
      end
    end
  end

  describe "validates length" do
    context "passwordが6文字以下のとき" do
      let(:user) { build(:user, password: "abcd") }

      it "エラーになる" do
        user.valid?
        expect(user.errors.full_messages_for(:password)).to include "パスワードは6文字以上で入力してください"
      end
    end
  end

  describe "validates uniqueness" do
    context "保存されたメールアドレスが指定されたとき" do
      let(:user1) { create(:user) }
      let(:user2) { build(:user, email: user1.email) }

      it "エラーになる" do
        user2.valid?
        expect(user2.errors.full_messages_for(:email)).to include "Eメールはすでに存在します"
      end
    end
  end
end
