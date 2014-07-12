require 'rails_helper'

RSpec.describe PushMessage, :type => :model do

  describe '验证' do
    it '推送消息为空的情况' do
      push_message = PushMessage.new
      push_message.message = ""
      expect(push_message.save).to eq(false)
    end

    it '推送消息超过80字的情况' do
      push_message = PushMessage.new
      push_message.message = "QWERQWERQWERQWERQWERQWERQWRQWRQWRQWRQWRQWERQWREQWREQWREQWRQWRQWREQRWQWRQWRQWRQWRQWREQWERQWERQWREQWREQRE"
      expect(push_message.save).to eq(false)
    end

    it '推送消息字数在1到80字的情况' do
      push_message = PushMessage.new
      push_message.message = "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊"
      expect(push_message.save).to eq(true)
    end
  end

end
