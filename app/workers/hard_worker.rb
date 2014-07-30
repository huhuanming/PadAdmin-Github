require"BPush"
 class HardWorker
  include Sidekiq::Worker

  def perform(id)
  	push_target = PushTarget.find_by_id(id)
  	message = PushMessage.find_by_id(push_target.push_message_id)
  	pad = BaiduPush.find_by(pad_id:push_target.pad_id)
    BPush.push_msg(pad.push_id, pad.channel_id, message.message)
end
end
