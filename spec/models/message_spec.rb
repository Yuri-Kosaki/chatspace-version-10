require 'rails_helper'

describe Message do
  describe '#create' do
    it "is invalid without a body" do
      message = Message.new(body: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end
  end
end

describe Message do
  describe '#create' do
    it "is invalid without a user_id" do
      message = Message.new(user_id: "")
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end
  end
end

describe Message do
  describe '#create' do
    it "is invalid without a group_id" do
      message = Message.new(group_id: "")
      message.valid?
      expect(message.errors[:group_id]).to include("を入力してください")
    end
  end
end


