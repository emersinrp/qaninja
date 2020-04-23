# class Database
#   def delete_product(name)
#     puts "DELETE FROM public.products where title = '#{name}';"
#     puts "DELETE FROM public.products where title = '" + name + "';"
#   end
# end

# Database.new.delete_product("Donkey Kong")

lista = ["Fernando", "Papito", "Joao"]

achou = lista.select { |item| item == "Fernando" }

puts achou

vingadores = [
  { nome: "Steve Rogers", nick: "Capitao América" },
  { nome: "Tony Stark", nick: "Homem de Ferrro" },
  { nome: "Thor", nick: "Deus do Trovao" },
]

vingador = vingadores.select { |item| item[:nome] == "Thor" }

puts vingador