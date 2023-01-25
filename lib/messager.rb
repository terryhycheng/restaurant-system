require "dotenv"
require 'twilio-ruby'
require 'json'


class Messager
  def initialize
    Dotenv.load
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
  end
  
  def send(list, time = Time.now, phone_num = ENV["TEST_PHONE_NUM"]) 
    
    # Calculate delivery time
    cooking_time = 60 * 10 * list.count # Every dish needs 10 minutes to cook
    delivery_time = time + cooking_time
    message_content = "Thank you! Your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"

    # Sending message via Twilio service
    # @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    # message = @client.messages.create(
    #   body: message_content,
    #   messaging_service_sid: ENV["TWILIO_MESSAGING_SERVICE_SID"],
    #   to: phone_num
    # )
    # return message.body

    # This line below is only for testing
    return message_content
  end
end