# Algorithmes de tri
def bubble_sort(arr)
  # Tri à bulles : compare et échange les éléments adjacents jusqu'à ce que le tableau soit trié
  n = arr.length                  # Récupère la taille du tableau
  loop do                         # Boucle principale
    swapped = false              # Variable pour suivre les échanges
    (n-1).times do |i|           # Parcourt le tableau jusqu'à n-1
      # Compare les éléments adjacents et les échange si nécessaire  
      if arr[i] > arr[i+1]       # Compare deux éléments adjacents
        arr[i], arr[i+1] = arr[i+1], arr[i]  # Échange les éléments
        swapped = true           # Marque qu'un échange a eu lieu
      end
    end
    break if not swapped        # Sort si aucun échange n'a été fait
  end
  arr                           # Retourne le tableau trié
end

def quick_sort(arr)
  # Tri rapide : utilise un pivot pour diviser le tableau en sous-tableaux
  return arr if arr.length <= 1   # Cas de base : tableau de taille 0 ou 1
  pivot = arr.delete_at(rand(arr.length))  # Choisit un pivot aléatoire
  # Divise le tableau en éléments plus petits et plus grands que le pivot
  left = arr.select { |x| x < pivot }     # Sous-tableau des éléments < pivot
  right = arr.select { |x| x >= pivot }   # Sous-tableau des éléments >= pivot
  quick_sort(left) + [pivot] + quick_sort(right)  # Combine récursivement
end

# Algorithmes de recherche 
def binary_search(arr, target)
  # Recherche binaire : cherche un élément dans un tableau trié
  left = 0                      # Index gauche
  right = arr.length - 1        # Index droit
  
  while left <= right          # Tant que la zone de recherche existe
    mid = (left + right) / 2   # Calcule le milieu
    if arr[mid] == target      # Si l'élément est trouvé
      return mid
    elsif arr[mid] < target    # Si l'élément est dans la moitié droite
      left = mid + 1
    else                       # Si l'élément est dans la moitié gauche
      right = mid - 1
    end
  end
  return nil                   # Élément non trouvé
end

# Algorithmes sur les graphes
def breadth_first_search(graph, start)
  # Parcours en largeur : explore un graphe niveau par niveau
  visited = []                # Liste des nœuds visités
  queue = [start]            # File des nœuds à visiter
  
  while queue.any?           # Tant qu'il y a des nœuds à visiter
    vertex = queue.shift     # Prend le premier nœud de la file
    if !visited.include?(vertex)  # Si le nœud n'a pas été visité
      visited << vertex      # Marque le nœud comme visité
      queue.concat(graph[vertex] - visited)  # Ajoute les voisins non visités
    end
  end
  visited                    # Retourne les nœuds visités
end

def depth_first_search(graph, start, visited = [])
  # Parcours en profondeur : explore un graphe en allant le plus loin possible
  visited << start          # Marque le nœud comme visité
  (graph[start] - visited).each do |vertex|  # Pour chaque voisin non visité
    depth_first_search(graph, vertex, visited)  # Visite récursivement
  end
  visited                   # Retourne les nœuds visités
end

# Algorithmes de chaînes de caractères
def levenshtein_distance(s1, s2)
  # Distance de Levenshtein : calcule la distance d'édition entre deux chaînes
  m = s1.length            # Longueur de la première chaîne
  n = s2.length            # Longueur de la deuxième chaîne
  d = Array.new(m + 1) { Array.new(n + 1) }  # Matrice de distance

  # Initialisation de la matrice
  (0..m).each { |i| d[i][0] = i }  # Première colonne
  (0..n).each { |j| d[0][j] = j }  # Première ligne

  # Calcul de la distance
  (1..n).each do |j|
    (1..m).each do |i|
      d[i][j] = if s1[i-1] == s2[j-1]  # Si les caractères sont identiques
                  d[i-1][j-1]
                else                     # Sinon, prend le minimum des opérations
                  [d[i-1][j] + 1,       # Suppression
                   d[i][j-1] + 1,       # Insertion
                   d[i-1][j-1] + 1      # Substitution
                  ].min
                end
    end
  end
  d[m][n]                 # Retourne la distance finale
end

# Algorithmes mathématiques
def fibonacci(n)
  # Suite de Fibonacci : calcule le n-ième nombre de Fibonacci
  return n if n <= 1      # Cas de base
  fibonacci(n-1) + fibonacci(n-2)  # Appel récursif
end

def prime?(n)
  # Test de primalité : vérifie si un nombre est premier
  return false if n <= 1  # Les nombres <= 1 ne sont pas premiers
  (2..Math.sqrt(n).to_i).none? { |i| n % i == 0 }  # Vérifie les diviseurs
end

def factorial(n)
  # Factorielle : calcule n!
  return 1 if n <= 1      # Cas de base
  n * factorial(n-1)      # Appel récursif
end
def gcd(a, b)
  # PGCD : calcule le plus grand commun diviseur
  while b != 0            # Algorithme d'Euclide
    a, b = b, a % b
  end
  a
end

def lcm(a, b)
  # PPCM : calcule le plus petit commun multiple
  (a * b).abs / gcd(a, b)  # Utilise la relation avec le PGCD
end

def power(base, exponent)
  # Exponentiation rapide : calcule base^exponent
  return 1 if exponent == 0  # Cas de base
  return base if exponent == 1
  
  temp = power(base, exponent/2)  # Calcul récursif
  if exponent.even?              # Si exposant pair
    temp * temp
  else                          # Si exposant impair
    base * temp * temp
  end
end

def sum_of_digits(n)
  # Somme des chiffres : calcule la somme des chiffres d'un nombre
  n.to_s.chars.map(&:to_i).sum  # Convertit en string, puis en tableau de chiffres
end

def is_perfect_square?(n)
  # Carré parfait : vérifie si un nombre est un carré parfait
  root = Math.sqrt(n)           # Calcule la racine carrée
  root == root.to_i            # Vérifie si c'est un entier
end

def collatz_sequence(n)
  # Suite de Collatz : génère la suite de Collatz pour un nombre
  sequence = [n]               # Initialise la séquence
  while n != 1                # Continue jusqu'à atteindre 1
    n = n.even? ? n/2 : 3*n + 1  # Applique la règle de Collatz
    sequence << n             # Ajoute le nouveau nombre
  end
  sequence                    # Retourne la séquence
end

def pascal_triangle(n)
  # Triangle de Pascal : génère les n premières lignes
  triangle = []              # Initialise le triangle
  n.times do |i|            # Pour chaque ligne
    row = []                # Nouvelle ligne
    (i + 1).times do |j|    # Pour chaque élément de la ligne
      if j == 0 || j == i   # Premier ou dernier élément
        row << 1
      else                  # Autres éléments
        row << triangle[i-1][j-1] + triangle[i-1][j]
      end
    end
    triangle << row         # Ajoute la ligne au triangle
  end
  triangle                  # Retourne le triangle
end
