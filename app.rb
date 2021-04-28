require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../",__FILE__)
require 'lib/app/scrapper.rb'

def menu1

  puts "———————————————————————————————————————————————————————————————————————————————————————————————"
  puts "• Bienvenue dans cette application qui va aller scrapper les mails des mairies du Val-d'Oise. •"
  puts "•                                                                                             •"
  puts "•                                — 1 — Scrapper les données                                   •"
  puts "•                                                                                             •"
  puts "•                                — 2 — Quitter l'application                                  •"
  puts "•                                                                                             •"
  puts "———————————————————————————————————————————————————————————————————————————————————————————————"
  puts ""
  print " •  "

  user_choice = gets.chomp.to_i
  case user_choice
  when 1
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    puts "•                                Scrap des données en cours ..                                •"
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    data = Scrapper.new.perform
    print "\n\n\n"
    return data
  when 2
    exit
  else
    menu1
  end

end
