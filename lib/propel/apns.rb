class APNS < Push

   attr_accessor :certPath

   def initialize(certPath = false)
      unless certPath
         @certPath = certPath
      end
      puts 'made it from APNS' + "\n\n#{certPath}"
   end

end
