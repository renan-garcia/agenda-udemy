namespace :utils do
  desc 'Generate database content.'
  task seed: :environment do
    puts 'Generate Contacs'
    100.times do
      Contact.create!([{ name: Faker::Name.name,
                         email: Faker::Internet.email,
                         kind: Kind.all.sample,
                         rmk: Faker::Lorem.paragraph([1, 2, 3, 4, 5].sample) }])
    end
    puts 'Contacs [OK]'

    puts 'Generate Addresses'
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts 'Address [OK]'

    puts 'Generate Phones'
    Contact.all.each do |contact|
      Random.rand(1..5).times do
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts 'Phones [OK]'
  end
end
