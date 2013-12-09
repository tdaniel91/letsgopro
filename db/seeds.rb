# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ability.delete_all
Contact.delete_all
Course.delete_all
Job.delete_all
Enterprise.delete_all
Article.delete_all
Person.delete_all
User.delete_all


user = User.new
user.id = "1"
user.email = "tiago@email.com"
user.password = "12345678"
user.password_confirmation = "12345678"
user.person_id = "1"
user.save!

person = Person.new
person.id ="1"
person.name = "Tiago"
person.birthday_date = DateTime.parse("15/02/1991 17:00")
person.city = "Lisboa"
person.phone = "111222333"
person.privacy = "1"
person.quote = "Acreditar é essencial, mas ter atitude é o que faz a diferença."
person.save!

user = User.new
user.id = "2"
user.email = "joao@email.com"
user.password = "12345678"
user.password_confirmation = "12345678"
user.person_id = "2"
user.save!

person = Person.new
person.id ="2"
person.name = "Joao"
person.birthday_date = DateTime.parse("15/02/1990 17:00")
person.city = "Caparica"
person.phone = "111222333"
person.privacy = "2"
person.quote = "Fraseeee."
person.save!

user = User.new
user.id = "3"
user.email = "filipe@email.com"
user.password = "12345678"
user.password_confirmation = "12345678"
user.person_id = "3"
user.save!

person = Person.new
person.id ="3"
person.name = "FIlipe"
person.birthday_date = DateTime.parse("15/02/1992 17:00")
person.city = "Caparica"
person.phone = "111222333"
person.privacy = "3"
person.quote = "Fraseeee outra quoteeeee."
person.save!

user = User.new
user.id = "4"
user.email = "daniel@email.com"
user.password = "12345678"
user.password_confirmation = "12345678"
user.person_id = "4"
user.save!

person = Person.new
person.id ="4"
person.name = "Daniel"
person.birthday_date = DateTime.parse("15/02/1992 17:00")
person.city = "Caparica"
person.phone = "111222333"
person.privacy = "0"
person.quote = "Fraseeee outra quoteeeee."
person.save!

Article.create(:user_id =>"1", :image =>"n1.jpg", :article_title => "Titulo Sample1", :article_text => "era uma x...")
Article.create(:user_id =>"2", :image =>"n2.jpg", :article_title => "Titulo Sample2", :article_text => "era uma y...")
Article.create(:user_id =>"1", :image =>"n3.jpg", :article_title => "Titulo Sample3", :article_text => "era uma z...")

Ability.create(:user_id => "1", :name => "RoR")
Ability.create(:user_id => "2", :name => "Java")
Ability.create(:user_id => "2", :name => "C++")
Ability.create(:user_id => "1", :name => "AJAX")

Course.create(:user_id =>"1", :name =>"LEI", :univ =>"FCT-UNL", :year => DateTime.parse("15/02/2007 17:00"))
Course.create(:user_id =>"2", :name =>"MIEE", :univ =>"FCT-UNL", :year => DateTime.parse("15/02/2005 17:00"))
Course.create(:user_id =>"1", :name =>"MEI", :univ =>"FCT-UNL", :year => DateTime.parse("15/02/2009 17:00"))

Enterprise.create(:id=>"1", :name => "Google", :history => "foi em 1995 que larry and....", :foundation => DateTime.parse("15/02/1995 17:00"), :email => "mail@gmail.com", :phone =>"999888333", :address =>"Av. da liberdade, nr3, 2825 caparica", :areas =>"A google pratica a sua actividade em diversas areas tais como web cenas, web coisas",  :projectos =>"Desenvolve projectos como Gmail,motor de busca", :admin_id => "2")
Enterprise.create(:id=>"2", :name => "Xerox", :history => "foi em 1995 que larry and....", :foundation => DateTime.parse("15/02/1995 17:00"), :email => "mail@gmail.com", :phone =>"999888333", :address =>"Av. da liberdade, nr3, 2825 caparica", :areas =>"A google pratica a sua actividade em diversas areas tais como web cenas, web coisas",  :projectos =>"Desenvolve projectos como Gmail,motor de busca", :admin_id => "3")

Job.create(:user_id => "1", :enterprise_id=>"1", :role=>"Manda chuva", :begin=> DateTime.parse("15/02/2009 17:00"), :end=> DateTime.parse("15/02/2012 17:00"))
Job.create(:user_id => "2", :enterprise_id=>"2", :role=>"Manda chuva", :begin=> DateTime.parse("15/02/2009 17:00"), :end=> DateTime.parse("15/02/2012 17:00"))
Job.create(:user_id => "3", :enterprise_id=>"1", :role=>"Developer", :begin=> DateTime.parse("15/02/2009 17:00"), :end=> DateTime.parse("15/02/2012 17:00"))

Contact.create(:user_id =>"1", :user2_id =>"2", :state =>"Aceite")
Contact.create(:user_id =>"2", :user2_id =>"1", :state =>"Aceite")
Contact.create(:user_id =>"1", :user2_id =>"3", :state =>"Aceite")
Contact.create(:user_id =>"3", :user2_id =>"1", :state =>"Aceite")
Contact.create(:user_id =>"1", :user2_id =>"4", :state =>"pending")
Contact.create(:user_id =>"4", :user2_id =>"1", :state =>"pending")