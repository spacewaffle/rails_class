module Email

require 'mandrill'

def self.send(subject, to, name="", html)
  begin
    mandrill = Mandrill::API.new Rails.application.secrets.mandrill_key
    message = {
      :subject=> subject, 
      :from_name=> "RailsClass",
      :from_email=> "jon@railsclass.com",
      :to=> [{
            "email"=>to,
            "name"=> name}], 
      :html=> html,
      :preserve_recipients => false
      }
    async = false
    result = mandrill.messages.send message, async
    
  rescue Mandrill::Error => e
      # Mandrill errors are thrown as exceptions
      puts "A mandrill error occurred: #{e.class} - #{e.message}"
      # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'    
      raise
  end
end

end