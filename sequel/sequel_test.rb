require 'sequel'
DB = Sequel.connect('postgres://sabine@localhost:5432/sabine')

# primary_key :id
# String :name
 #Float :price
#end

class Item < Sequel::Model
end

#p Item.table_name #=> :postgres

#Item.insert(:name => 'chop suey', :price => rand * 100)
#i = Item[3]
#i.update(:name =>"duckwing", :price => rand * 100)
#p Item.all