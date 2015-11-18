class GCM < Push

   attr_accessor :appKey

   def initialize(appKey = false)
      unless appKey
         @appKey = appKey
      end
      puts 'made it from GCM' + "\n\n#{appKey}"
   end

end
