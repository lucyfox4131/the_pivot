require 'twilio-ruby'

class TextSender



  client = Twilio::REST::Client.new(ENV["live_twilio_account_sid"], ENV["live_twilio_auth_token"])
  from   = "+17606542678" # Your Twilio number
  data   = {
    :from => from,
    :to => "+16197884990",
    :body => "I'm using an API!",
  }

  client.account.messages.create(data)

  puts "Sent message!."

end
