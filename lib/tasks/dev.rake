namespace :dev do
  desc "Popula Banco de Dados"
  task setup: :environment do
    puts "Resetando o Banco de Dados..."
    %x(rails db:drop db:create db:migrate)

    puts "Cadastrando..."
    
    kinds = %w(Telefone Celular Comercial)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )    
    end
    
    30.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email ,
        birthdate: Faker::Date.between(2.days.ago, Date.today),
        kind: Kind.all.sample
      )
      end

      Contact.all.each do |contact|
        Random.rand(5).times do |i|
          phone = Phone.create!(
            number: Faker::PhoneNumber.cell_phone
            #contact: Contact.all.sample
            )
          contact.phones << phone
          contact.save!
        end
      end
      
      Contact.all.each do |contact|
        address = Address.create!(
          street: Faker::Address.street_address, 
          city: Faker::Address.city,
          contact: contact
        )
      end
    puts "Cadastrado!"
  end
end