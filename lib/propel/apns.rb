require 'http'

class APNS < Push

   @tokens = []
   @messages = []
   attr_accessor :certPath


   def initialize(certPath = false)
      super("")
      @certPath = certPath || File.dirname(__FILE__)
   end


end
