# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_hole
    if Hole.count != 18
        hole_1 = Hole.create(lat: 30.418409, lng: -97.642160, icon: './1.png', pic: './hole1.jpg', par: 3)
        hole_2 = Hole.create(lat: 30.418616, lng: -97.643808, icon: './2.png', pic: './hole2.jpg', par: 3)
        hole_3 = Hole.create(lat: 30.419166, lng: -97.645004, icon: './3.png', pic: './hole3.jpg', par: 3)
        hole_4 = Hole.create(lat: 30.418275, lng: -97.644298, icon: './4.png', pic: './hole4.jpg', par: 3)
        hole_5 = Hole.create(lat: 30.417540, lng: -97.644073, icon: './5.png', pic: './hole5.jpg', par: 3)
        hole_6 = Hole.create(lat: 30.418073, lng: -97.643021, icon: './6.png', pic: './hole6.jpg', par: 3)
        hole_7 = Hole.create(lat: 30.417565, lng: -97.641468, icon: './7.png', pic: './hole7.jpg', par: 4)
        hole_8 = Hole.create(lat: 30.417090, lng: -97.640781, icon: './8.png', pic: './hole8.jpg', par: 3)
        hole_9 = Hole.create(lat: 30.417625, lng: -97.641231, icon: './9.png', pic: './hole9.jpg', par: 4)
        hole_10 = Hole.create(lat: 30.418957, lng: -97.641461, icon: './10.png', pic: './hole10.jpg', par: 3)
        hole_11 = Hole.create(lat: 30.420602, lng: -97.642395, icon: './11.png', pic: './hole11.jpg', par: 5)
        hole_12 = Hole.create(lat: 30.422089, lng: -97.643123, icon: './12.png', pic: './hole12.jpg', par: 3)
        hole_13 = Hole.create(lat: 30.423475, lng: -97.643368, icon: './13.png', pic: './hole13.jpg', par: 3)
        hole_14 = Hole.create(lat: 30.425023, lng: -97.643426, icon: './14.png', pic: './hole14.jpg', par: 3)
        hole_15 = Hole.create(lat: 30.424269, lng: -97.644198, icon: './15.png', pic: './hole15.jpg', par: 3)
        hole_16 = Hole.create(lat: 30.423618, lng: -97.643935, icon: './16.png', pic: './hole16.jpg', par: 3)
        hole_17 = Hole.create(lat: 30.422374, lng: -97.643315, icon: './17.png', pic: './hole17.jpg', par: 3)
        hole_18 = Hole.create(lat: 30.420790, lng: -97.643123, icon: './18.png', pic: './hole18.jpg', par: 4)
    end
end


yining = User.create(email: "daphnewang0826@gmail.com", firstname: "yining", lastname: "woof", password: "123")
heidi = User.create(email: "heidi@heidi.com", firstname: "heidi", lastname: "b", password: "123")

# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
# game1 = Game.create(date: Time.now.strftime("%FT%T.%LZ"))


def seed_data
    5.times do
        game = Game.create(date: Time.now.strftime("%FT%T.%LZ"))
        rounds = game.rounds.build([{name: Faker::Name.name, user: User.find(2)}, {name: Faker::Name.name, user: User.find(2)}, {name: Faker::Name.name, user: User.find(2)}])
        rounds.each(&:save)
        rounds.length.times do |i|
            18.times do |h|
                score = rounds[i].scores.build({score: Faker::Number.between(from: 1, to: 10), hole_id: h + 1})
                score.save
            end
        end
    end
end

seed_hole()
seed_data()


# yining_heidi_game = Game.create(date: Time.now.strftime("%m/%d/%Y"))

# yining_round_1 = yining.rounds.build()
# yining_heidi_game.rounds << yining_round_1

# heidi_round_1 = heidi.rounds.build()
# yining_heidi_game.rounds << heidi_round_1

