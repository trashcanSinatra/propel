class Push

   @@types = { 'google' => 'GCM', 'apple' => 'APNS' }

   def self.NotificationStream(type)
      return false unless @@types.has_key?(type)
      cls = Object.const_get(@@types[type])
      pushMananger = cls.new
      return pushMananger
   end

end
