class NilClass
   primitive_nobridge '&', '_rubyAnd:'
   #  For receiver nil,  Or and Xor are the same
   primitive_nobridge '^', '_rubyOr:'
   primitive_nobridge '|', '_rubyOr:'

   primitive 'nil?' , '_rubyNilQ'
   primitive 'to_a' , '_ruby_to_a'

   primitive 'to_f' , '_ruby_to_f'
   primitive 'to_i' , '_ruby_to_i'
   primitive 'to_s' , '_ruby_to_s'

   def self.name
      # override Smalltalk name
      'NilClass'
   end

   def inspect
     "nil"
   end

   def backtrace
     nil
   end

   # support for RubyBackRefNode productions when $~ is nil 
   def pre_match
    nil
   end
   def post_match
     nil
   end
   def _plus_match
     nil
   end

   def call
     # invoked when yield used with no block argument 
     raise LocalJumpError , 'no block was passed'
   end

end
