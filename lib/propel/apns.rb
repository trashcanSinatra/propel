class APNS < Push

   attr_accessor :certPath

   def initialize(certPath = false)
      if certPath
         @certPath = certPath
      end
      puts 'made it from APNS' + "\n\n#{certPath}"
   end

end
