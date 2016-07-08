require 'twilio-ruby'

class TextSender

  def self.send_text_message(url)
    numbers_to_send_to = User.pluck(:cell).reject{|num| num.to_s.empty? || num == "1112223333"}
    twilio_sid = ENV["live_twilio_account_sid"]
    twilio_token = ENV["live_twilio_auth_token"]
    twilio_phone_number = "7606542678"
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    numbers_to_send_to.each do |number|
      @twilio_client.account.sms.messages.create(
        :from => "+1#{twilio_phone_number}",
        :to => number,
        :body => "New family added to Refugee Restore.  See details: #{url} "
      )
    end
  end
end
