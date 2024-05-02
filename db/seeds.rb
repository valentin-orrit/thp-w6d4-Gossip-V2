require "faker"

User.destroy_all
Gossip.destroy_all
City.destroy_all
Tag.destroy_all
Message.destroy_all
Recipient.destroy_all


#créer 10 villes aléatoires
cities = []
10.times do
    city= City.create!(name: Faker::Address.city, zip_code: Faker::Address.postcode)
    cities << city
end

#créer 10 utilisateurs aléatoires
users = []
10.times do
    user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph(sentence_count:5), city_id: rand(1..10), email: Faker::Internet.email, age: Faker::Number.between(from: 13, to: 60), password_digest: Faker::Lorem.paragraph(sentence_count:1))
    #user.city = cities.sample
    users << user
    
end

#créer 10 gossips aléatoires
gossips = []
20.times do
    gossip = Gossip.create!(title: Faker::Hacker.say_something_smart[3, 14], description: Faker::Lorem.paragraph(sentence_count:5), user: users.sample)
    gossips << gossip
end

#vérifier l'insertion et l'attribution users/gossips
users[0].gossips #changer l'index si pas de gossips

#créer 10 tags aléatoires
tags = []
10.times do
    tag = Tag.create!(name: Faker::Lorem.words(number: 1), user: users.sample)
    tags << tag
end

#attribuer 10 tags aléatoires à un ou plusieurs gossips
10.times do
    gossiptag = GossipTag.create!(gossip: gossips.sample, tag: tags.sample)
end

#vérifier tags du user index 0 et du gossip index 0
users[0].tags
gossips[0].tags

#vérifier la ville de user index 5
users[5].city

#création de 25 messages aléatoires + attribution d'un destinataire obligatoire
messages = []
25.times do
    message = Message.create!(user: users.sample, message: Faker::Lorem.paragraph(sentence_count:5))
    recipient = Recipient.create(user: users.sample, message: message)
    messages << message
end

#attribution de plusieurs messages avec un ou plusieurs destinataires
25.times do
    recipient = Recipient.create(user: users.sample, message: messages.sample)
end

25.times do
    comment = Comment.create(user_id: rand(1..10), gossip_id: rand(1..20), content: Faker::Lorem.paragraph(sentence_count: rand(5..20)) )
end
