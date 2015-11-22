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


   def queue_messages(msgs)
      unless valid_arg?(msgs)
         puts "You must provide at least one message"
         return false
      else
         msgs = [msgs] if msgs.is_a? String
         msgs.map {|msg| add('msg', msg)}
      end
   end

   def unqueue(items)
      unless valid_arg?(items)
         puts "Please provide a valid item to unqueue"
      else
         items = [items] if items.is_a? String
         items.map do |item|
            if self.class.tokens.include?(item)
               self.class.tokens.delete(item)
            elsif self.class.messages.include?(item)
               self.class.messages.delete(item)
            else
               puts "\"#{item}\" is not in either queue."
            end # IF
         end # DO
      end # UNLESS
   end # UNQUEUE

   def valid_arg?(arg)
      return false if !arg
      return false if arg == ""
      return false if arg.is_a? Numeric
      return true
   end


   def duplicate?(tokens)
      dup = []
      tokens.map do |tkn|
      dup << tkn if self.class.tokens.include?(tkn)
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
      puts "Queued Tokens: \n"
      puts "\t" + self.class.tokens.to_s
      puts "Queud Messages: \n"
      puts "\t" + self.class.messages.to_s
   end

end  # Class Push
