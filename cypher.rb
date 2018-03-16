require 'sinatra'



#puts "Secrets! Put in a message and I'll encode it for you."
#message = gets.chomp
#puts "Input a (whole) number for me to use."
#shift = gets.chomp.to_i

def ceasar_cypher(message,shift)
new_message = []
letters = message.split('') 
letters.each do |lett|
    num = lett.ord
    if num.between?(97,122)
      num = (num + shift)
      if num > 122
        num = (num - 122) + 96
        elsif num < 97
          num = (num + 122) - 96
      end
    end
    if num.between?(65,91)
         num = (num + shift)
      if num > 91
        num = (num - 91) + 65
        elsif num < 65
          num = (num + 91) - 65
      end
    end
    new_message << num.chr
end
return new_message.join
end




get '/' do
  message = params["message"]
  shift = params["shift"].to_i
  new_message = ceasar_cypher(message,shift) unless message.nil?
  #render erb template called index. Create local variable for x that is equal to x from this file.
  erb :index, :locals => {:shift => shift, :message => message, :new_message => new_message}
end
