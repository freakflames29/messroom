# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Randomdb.create! name:"rick",price: 500,location:'kolkata',mtype:'2bhk'
# Randomdb.create! name:"mark",price: 600,location:'delhi',mtype:'3bhk'
# Randomdb.create! name:"bts",price: 900,location:'korea',mtype:'1bhk'
# Randomdb.create! name:"rose",price: 200,location:'usa',mtype:'1bhk'
# Randomdb.create! name:"mirabel",price: 400,location:'spain',mtype:'5bhk'
# Randomdb.create! name:"sourav",price: 500,location:'mumbai',mtype:'2bhk'

Rating.create!({user:User.find(2),mess:Mess.find(16),rating:4})
Rating.create!({user:User.find(3),mess:Mess.find(16),rating:2})
Rating.create!({user:User.find(4),mess:Mess.find(16),rating:3})
Rating.create!({user:User.find(5),mess:Mess.find(16),rating:4})
Rating.create!({user:User.find(7),mess:Mess.find(16),rating:5})
Rating.create!({user:User.find(9),mess:Mess.find(16),rating:4})
Rating.create!({user:User.find(10),mess:Mess.find(16),rating:3})