module Propel

class GCM < Push

   @tokens = []
   @messages = []
   attr_reader :appKey

   def initialize(appKey = false)
      super('https://android.googleapis.com/gcm/send')
      @appKey = appKey || ""
      @postHeaders = {:'Content-Type' => 'application/json',
                      :Authorization => "key=#{@appKey}"}
   end


   def postHeaders
      return @postHeaders
   end


   def addHeader(key, value)
      @postHeaders[key] = value
   end


   def delHeader(header)
      if @postHeaders.has_key?(header)
         @postHeaders.delete(header)
      else
         puts "The key \"#{header}\" doesn't exist."
      end
   end


   def appKey=(key)
      @appKey = key
      addHeader(:Authorization, "key=#{key}")
   end


   def push(tkns, msgs)

   end

end

end
