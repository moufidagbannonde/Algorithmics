# Les variables
my_name = "John" # string
my_age = 25 # integer

# Les opérateurs
addition = 1 + 1 # = 2
soustraction = 2 - 1 # = 1
multiplication = 2 * 3 # = 6
division = 6 / 2 # = 3
reste_de_division = 7 % 3 # = 1

# Les conditions
# if my_age < 18
#   puts "Tu es mineur !"
# else
#   puts "Tu es majeur !"
# end

# Les boucles

# (1..5).each do |i|
#   puts "Bonjour, je m'appelle #{my_name} et j'ai #{my_age} ans"
# end

# Boucles for en ruby
def indexCounter(n)
  for i in 0..n do
    puts "Je suis à l'index #{i} de la boucle jusqu'à #{n}"
  end  
end
  # afficher les nombre pairs de 0 à 50
  def evenNumberLargeThanFifty
  for i in 0..10 do
    if i % 2 == 0
      puts "Le nombre #{i} est pair"
    else
      puts "Le nombre #{i} est impair"
    end 
  end
end
# Les fonctions
# def say_hello(name)
#   puts "Bonjour, #{name} !"
# end

def main 
  indexCounter(5)
  evenNumberLargeThanFifty()
end

main()
# say_hello("John")

