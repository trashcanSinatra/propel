class Push

   @@types = {'google' => 'GCM', 'apple' => 'APNS'}
   @@tokens = []
   @@messages = []

   class << self

      def OpenStream(type, *args)
         return false unless @@types.has_key?(type)
         # Technique for getting Class from string
         cls = Object.const_get(@@types[type])
         pushMananger = cls.new(*args)
         return pushMananger
      end

      def push_manager(*args)
         return false if self == Push
         return self.new(*args)
      end
   end # Class Self


end  # Class Push
