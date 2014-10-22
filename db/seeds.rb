#User roles seeds
puts "Seeding Roles ..."

roles = ["customer", "vendor", "administrator"]

roles.each do |role|
	Role.find_or_create_by(name: role)
end

#User's seeds
puts "Seeding Administrator ..."

administrator = User.create_with(first_name: "Admin", last_name: "Adminov",
 																 password: "aaaa1234", password_confirmation: "aaaa1234").
										 find_or_create_by(email: "admin@kashtanka.com")

administrator.roles << Role.find_by(name: roles.last)
