class Push

   @@types = {'google' => 'GCM', 'apple' => 'APNS'}


   class << self

      attr_accessor :tokens, :messages

      def NotificationStream(type, *args)
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


   def queue_tokens(tokens)
      unless valid_arg?(tokens)
         puts "You must provide at least one token to store."
         return false
      else
         tokens = [tokens] if tokens.is_a? String
         if duplicates = duplicate?(tokens)
            puts "There are duplicate tokens: " + duplicates.to_s
         else
            tokens.map {|tkn| add('tkn', tkn)}
         end
      end
   end


   def valid_arg?(arg)
      return false if !arg
      return false if arg == ""
      return false if arg.is_a? Numeric
      return true
   end


   def duplicate?(tokens)
      dup = []
      for token in tokens do
         if self.class.tokens.include?(token)
            dup << token
         end
      end
      if dup.any?; return dup; else false; end
   end


   def add(type, item)
      if type == 'tkn'
         self.class.tokens << item
      elsif type == 'msg'
         self.class.messages << item
      else
         puts "You must provide a type: tkn or msg \n\n"
      end
   end


   def to_s()
      puts self.class.tokens
   end

end  # Class Push
