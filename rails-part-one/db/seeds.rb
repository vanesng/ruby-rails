# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def create_mirrors
  Mirror.create codename: 'blueprint'
end

def create_members
  5.times do |i|
    Member.create activity: i,
                  first_name: "first#{i}",
                  last_name: "last#{i}",
                  mirror_id: 1
  end
end

create_mirrors
create_members