class Push

   @@types = { 'google' => 'GCM', 'apple' => 'APNS' }

   def self.OpenStream(type, *args)
      return false unless @@types.has_key?(type)
      cls = Object.const_get(@@types[type])
      pushMananger = cls.new(*args)
      return pushMananger
   end

end
