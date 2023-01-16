# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!({ email: "usman.nasir@devsinc.com",
               first_name: "Usman",
               last_name: "Nasir",
               role: 0,
               password: "aaaaaa" })

User.create!({ email: "sq1@devsinc.com",
               first_name: "Usman",
               last_name: "Sq_1",
               role: 2,
               password: "aaaaaa" })
User.create!({ email: "sq2@devsinc.com",
               first_name: "Usman",
               last_name: "Sq_2",
               role: 2,
               password: "aaaaaa" })
User.create!({ email: "dev1@devsinc.com",
               first_name: "Usman",
               last_name: "Dev_1",
               role: 1,
               password: "aaaaaa" })
User.create!({ email: "dev2@devsinc.com",
               first_name: "Usman",
               last_name: "Dev_2",
               role: 1,
               password: "aaaaaa" })
User.create!({ email: "usman.nasir011@devsinc.com",
               first_name: "Usama",
               last_name: "Nasir",
               role: 0,
               password: "aaaaaa" })

usman = User.first
usama = User.last

usman.projects.create(title: "Project A", description: "project a description", manager_id: usman.id)
usman.projects.create(title: "Project B", description: "project b description", manager_id: usman.id)
usama.projects.create(title: "Project C", description: "project c description", manager_id: usama.id)
usama.projects.create(title: "Project D", description: "project d description", manager_id: usama.id)
