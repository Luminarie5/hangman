# name: Виселица
# discription: популярная детская игра
# source: https://ru.wikipedia.org/wiki/Виселица_(игра)
#
# version: 5.1
# ruby_version:2.3
# encoding:utf-8

require 'unicode_utils/upcase'

require_relative 'lib/game'
require_relative 'lib/result_printer'
require_relative 'lib/word_reader'

VERSION = 'Игра "Виселица", версия 5.1'

word_reader     = WordReader.new
words_file_name = "#{File.dirname(__FILE__)}/data/words.txt"

if word_reader.read_from_args.nil?
  word = word_reader.read_from_file(words_file_name)
else
  word = word_reader.read_from_args
end

game         = Game.new(word)
game.version = VERSION

printer = ResultPrinter.new(game)

while game.in_progress?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
