module BPush
  require 'socket'
  require 'net/http'
  require 'openssl'
  require 'json'

  SecretKey = 'saPyIBDxUOInSkbvWttl4whih0xfHC3k'
  APIKey = '07Wwhw3vfVWn4SIM0xVi4I4T'
  @pass = nil  

  class << self
    attr_accessor :pass
  end

  def self.send_notification(bpush_user_id, message)
    n = APNS::Notification.new(device_token, message)
    self.send_notifications([n])
  end

  def self.push_msg(bpush_id,channel_id,messages)
      uri = URI.parse('http://channel.api.duapp.com/rest/2.0/channel/channel')
      message_hash = {
                    'aps' => {
                        'alert'=> messages,
                        'sound'=>"",
                        'badge'=>1,
                    },
                    'key1'=>"value1", 
                    'key2'=>"value2",

                    "title" => messages ,   
                    "description" => messages,
                    "custom_content" => {
                      "key1" => "value1", 
                      "key2" => "value2",
                    }, 
                  }
      parmas = {             
                'apikey'      =>      APIKey,
                'channel_id'  =>      channel_id,
                'message_type'=>      1,
                'messages'    =>      message_hash.to_json,
                'method'      =>      'push_msg', 
                'msg_keys'    =>      Time.new.to_i,
                'push_type'   =>      1,
                'timestamp'   =>      Time.new.to_i,
                'user_id'     =>      bpush_id,
              }
      self.connect(uri, parmas)


      parmas = {             
                'apikey'      =>      APIKey,
                'channel_id'  =>      channel_id,
                'message_type'=>      0,
                'messages'    =>      'hello android',
                'method'      =>      'push_msg', 
                'msg_keys'    =>      Time.new.to_i,
                'push_type'   =>      1,
                'timestamp'   =>      Time.new.to_i,
                'user_id'     =>      bpush_id,
              }
      self.connect(uri, parmas)
  end

  def self.query_device_type
      uri = URI.parse('http://channel.api.duapp.com/rest/2.0/channel/4652698898520089056')
      parmas = {             
                'apikey' => APIKey,
                'method' => 'query_device_type', 
                'timestamp' => Time.new.to_i,
              }
      self.connect(uri, parmas)
  end

  def self.connect(uri, parmas)
    Net::HTTP.start(uri.host, uri.port) do |http|
      req = Net::HTTP::Post.new(uri.path)
      req.set_form_data(self.getSign(uri,parmas))
      puts http.request(req).body
    end
  end

  def self.getSign(uri, parmas)
    param = 'POST'+uri.to_s
    parmas.each {|key, value| param << "#{key}=#{value}" }
    param<<SecretKey
    uriencode = CGI::escape(param)
    sign = Digest::MD5::hexdigest(uriencode)
    hash = parmas.merge('sign' => sign)
    return hash
  end

end
