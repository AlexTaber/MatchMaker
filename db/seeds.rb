emails = [
["ayme.alvarez@gmail.com", "Female"],
["angiegrace84@gmail.com", "Female"],
["samantha.belkin@gmail.com", "Female"],
["julia.castro@outlook.com", "Female"],
["gechrod@gmail.com", "Female"],
["deborah.a.milburn@gmail.com", "Female"],
["tara.c.frye@gmail.com", "Female"],
["ayakokurushima@gmail.com", "Female"],
["ginny.w.martin@gmail.com", "Female"],
["grace.yasukawa@gmail.com", "Female"],
["emilygerngross@gmail.com", "Female"],
["iring.ma@gmail.com", "Female"],
["ling.giang@gmail.com", "Female"],
["lkim3182@gmail.com", "Female"],
["sara.gilford@gmail.com", "Female"],
["mary.c.baylis@gmail.com", "Female"],
["jldennison@gmail.com", "Female"],
["schmidtsusanr@gmail.com", "Female"],
["esm1018@gmail.com", "Female"],
["tprabhakar@ucdavis.edu", "Female"],
["kirsty.l.m@gmail.com", "Female"],
["anna.m.macdonald@gmail.com", "Female"],
["stephanielopez.sf@gmail.com", "Female"],
["lauranyb@gmail.com", "Female"],
["echenique11@gmail.com","Male"],
["scottbwarner@gmail.com","Male"],
["sid.watal@gmail.com", "Male"],
["charles.green88@gmail.com","Male"],
["imharrypark@gmail.com", "Male"],
["cetswanson@gmail.com", "Male"],
["ben.costolo@gmail.com", "Male"],
["luciankahn@gmail.com", "Male"],
["mmschneerson@gmail.com", "Male"],
["marc.cardacci@gmail.com", "Male"],
["sixthand6th@gmail.com", "Male"],
["sheld0ri@gmail.com", "Male"],
["arthur.ross.wilson@gmail.com", "Male"],
["bkmorimoto@gmail.com", "Male"],
["nlee43@gmail.com", "Male"],
["stauntonsample@gmail.com","Male"],
["manentea@gmail.com", "Male"],
["lauris.bernhart@gmail.com", "Male"],
["werbeckes@gmail.com", "Male"],
["nathaniel.clapp@gmail.com", "Male"],
["logandsprice@gmail.com", "Male"],
["guilsa001@gmail.com", "Male"],
["nguyennam9696@gmail.com", "Male"],
["peterjacobson.nz@gmail.com", "Male"]
]

def find_gravatar_url(user)
  hash = Digest::MD5.hexdigest(user.email)
  return "http://www.gravatar.com/avatar/#{hash}"
end

def pref_gender
  ["Female", "Male"].sample
end

alex = User.create!(name: "Alex Taber", email: "alex.taber0@gmail.com", birthday: Faker::Date.between(23.years.ago, 24.years.ago), gender: "male", location: "NYC", password: "123", preferred_gender: "female")
b = User.create!(name: "Brendan Miranda", email: "me@brendanmiranda.com", birthday: Faker::Date.between(33.years.ago, 34.years.ago), gender: "male", location: "NYC", password: "123", preferred_gender: "female")
dora = User.create!(name: "Doraly Pantaleon", email: "doralyp@me.com", birthday: Faker::Date.between(26.years.ago, 27.years.ago), gender: "female", location: "NYC", password: "123", preferred_gender: "male")
t = User.create!(name: "Tracy Teague", email: "tracy.teague05@gmail.com", birthday: Faker::Date.between(26.years.ago, 27.years.ago), gender: "female", location: "NYC", password: "123", preferred_gender: "male")
corey = User.create!(name: "Corey Nilan", email: "cnilan@gmail.com", birthday: Faker::Date.between(24.years.ago, 34.years.ago), gender: "female", location: "NYC", password: "123", preferred_gender: "male")

emails.each do |cur_email, gender|
  user = User.create!(name: Faker::Name.name, email: cur_email, password: "123", location: Faker::Address.city, gender: gender, birthday: Faker::Date.between(50.years.ago, 18.years.ago), bio: Faker::Hacker.say_something_smart, preferred_gender: pref_gender )
  user.update_attributes(picture_url: find_gravatar_url(user))
  unless cur_email == "alex.taber0@gmail.com"
    Friendship.create!(user: alex, friend_id: user.id, status: "approved")
    Friendship.create!(user: dora, friend_id: user.id, status: "approved")
  end
end

User.create!(name: "Matchmaker", email: "yogibrendan@gmail.com", birthday: Faker::Date.between(50.years.ago, 18.years.ago), gender: "none", location: "NYC", password: "123", preferred_gender: pref_gender)

pairing_corey = Pairing.create!(user: corey, pair: User.where(gender: 'male').order(id: :asc).last)

pairing = Pairing.create!(user_id: b.id, pair_id: t.id)

da_pairing = Pairing.create!(user: alex, pair: dora)
third_pairing = Pairing.create!(user: alex, pair: corey)

friendship = Friendship.create!(user: alex, friend: b, status: "approved")
friendship = Friendship.create!(user: dora, friend: corey, status: "approved")

pairing.votes.build(pairing_id: pairing.id, user_id: 7, score: 1).save!

da_pairing.votes.build(pairing_id: da_pairing.id, user_id: 7, score: 1).save
da_pairing.votes.build(pairing_id: da_pairing.id, user_id: 8, score: 1).save

