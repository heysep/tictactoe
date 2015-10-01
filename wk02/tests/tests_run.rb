require "pry"
require "./coffee"
require "./human"
   trevor = Human.new "Trevor"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    trevor.buy tsmf

binding.pry