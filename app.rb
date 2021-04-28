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

def menu2

  puts "———————————————————————————————————————————————————————————————————————————————————————————————"
  puts "•                  Sous quel format souhaitez-vous enregistrer les données ?                  •"
  puts "•                      rentrez le numéro de l'option qui cous convient :                      •"
  puts "•                                                                                             •"
  puts "•                                   — 1 — .json                                               •"
  puts "•                                                                                             •"
  puts "•                                   — 2 — Google Spreadsheet                                  •"
  puts "•                                                                                             •"
  puts "•                                   — 3 — .csv                                                •"
  puts "•                                                                                             •"
  puts "•                                   — 4 — Quitter                                             •"
  puts "•                                                                                             •"
  puts "———————————————————————————————————————————————————————————————————————————————————————————————"
  puts ""
  print " •  "

  user_choice = gets.chomp.to_i

  case user_choice
  when 1
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    puts "•               Vous avez choisi d'enregistrer les données sous le format .json               •"
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    data_json = Scrapper.new.save_as_JSON(data)
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    puts "•            Vous retrouverez votre fichier à l'adresse suivante : db/emails.json             •"
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
  when 2
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    puts "•        Vous avez choisi d'enregistrer les données sous le format Google Spreadsheet         •"
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    data_speadsheet = Scrapper.new.save_as_spreadsheet(data)
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    puts "•                  Vous retrouverez votre fichier à l'adresse suivante : ...                  •"
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
  when 3
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    puts "•               Vous avez choisi d'enregistrer les données sous le format .csv                •"
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    data_csv = Scrapper.new.save_as_csv(data)
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    puts "•             Vous retrouverez votre fichier à l'adresse suivante : db/emails.csv             •"
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
  when 4
    exit
  else
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    puts "•                              VOTRE ENTREE N'EST PAS RECONNUE.                               •"
    puts "———————————————————————————————————————————————————————————————————————————————————————————————"
    menu2
  end

end

menu1
menu2
