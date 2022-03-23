# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



employees = [
    {
        first_name: 'Nicolas',
        last_name: 'Genest',
        title: 'CEO',
        email: 'nicolas.genest@codeboxx.biz'
    },
    {
        first_name: 'Nadya',
        last_name: 'Fortier',
        title: 'Director',
        email: 'nadya.fortier@codeboxx.biz'
    },
    {
        first_name: 'Martin',
        last_name: 'Chantal',
        title: 'Director Assistant',
        email: 'martin.chantal@codeboxx.biz'
    },
    {
        first_name: 'Mathieu',
        last_name: 'Houde',
        title: 'Captain',
        email: 'mathieu.houde@codeboxx.biz'
    },
    {
        first_name: 'Patrick ',
        last_name: 'Thibault',
        title: 'Captain',
        email: 'patrick.thibault@codeboxx.biz'
    },
    {
        first_name: 'David',
        last_name: 'Boutin',
        title: 'Engineer',
        email: 'david.boutin@codeboxx.biz'
    },
    {
        first_name: 'Mathieu',
        last_name: 'Lortie',
        title: 'Engineer',
        email: 'mathieu.lortie@codeboxx.biz'
    },
    {
        first_name: 'Thomas',
        last_name: 'Carrier',
        title: 'Engineer',
        email: 'thomas.carrier@codeboxx.biz'
    },
    {
        first_name: 'Serge',
        last_name: 'Savoie',
        title: 'Engineer',
        email: 'serge.savoie@codeboxx.biz'
    },
    {
        first_name: 'Francis',
        last_name: 'Patry-Jessop',
        title: 'Engineer',
        email: 'francis.patry-jessop@codeboxx.biz'

    },
    {
        first_name: 'Mathieu',
        last_name: 'Lefrancois',
        title: 'Engineer',
        email: 'mathieu.lefrancois@codeboxx.biz'
    },
    {
        first_name: 'David',
        last_name: 'Larochelle',
        title: 'Engineer',
        email: 'david.larochelle@codeboxx.biz'
    },
    {
        first_name: 'Nicolas',
        last_name: 'Pineault',
        title: 'Engineer',
        email: 'nicolas.pineault@codeboxx.biz'
    },
    {
        first_name: 'David',
        last_name: 'Amyot',
        title: 'Engineer',
        email: 'david.amyot@codeboxx.biz'
    },
    {
        first_name: 'Remi',
        last_name: 'Gagnon',
        title: 'Engineer',
        email: 'remi.gagnon@codeboxx.biz'
    },
    {
        first_name: 'Timothy',
        last_name: 'Wever',
        title: 'Developer',
        email: 'timothy.wever@codeboxx.biz'
    },
    {
        first_name: 'Kiril',
        last_name: 'Kleinerman',
        title: 'Developer',
        email: 'kiril.kleinerman@codeboxx.biz'
    },
    {
        first_name: 'Emmanuela',
        last_name: 'Derilus',
        title: 'Developer',
        email: 'emmanuela.derilus@codeboxx.biz'
    },
    {
        first_name: 'Abdul',
        last_name: 'Akeeb',
        title: 'Developer',
        email: 'abdul.akeeb@codeboxx.biz'
    },
    {
        first_name: 'Krista',
        last_name: 'Sheely',
        title: 'Developer',
        email: 'krista.sheely@codeboxx.biz'
    },
    {
        first_name: 'Jonathan',
        last_name: 'Murray',
        title: 'Developer',
        email: 'jonathan.murray@codeboxx.biz'
    }
    
]


# <Model>.create({ key: value })
# <Model>.create({ "key" => value })
# <Model>.create( key: value )
    
employees.each do |employee|
    user = User.create!(
        email: employee[:email],
        password: "password",
        is_admin: TRUE, 
    )


    Employee.create!(
        first_name: employee[:first_name],
        last_name: employee[:last_name],
        title: employee[:title],
        email: employee[:email],
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30'),
        user: user   
    )
end

170.times do
    leads = Lead.create!(
        
        full_name: Faker::Name.name,
        company_name: [Faker::Name.last_name + " " + Faker::Company.suffix, Faker::Restaurant.name, Faker::University.name, Faker::Space.agency].sample,
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone,
        project_name: Faker::Name.unique.name,
        project_description: Faker::Lorem.paragraph(sentence_count: 2),
        department: ["Marketing", "Corporate", "Residential"].sample, 
        message: Faker::Lorem.paragraph(sentence_count: 2),
        attachment: Faker::LoremFlickr.image,
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30')
    )
end

100.times do
    address = Addressy::US.fetch(150).first
    addresses = Address.create!(
        
        address_type: ["House", "Apartment", "Commercial", "Corporate", "Hybrid"].sample,
        status: ["Active", "Inactive"].sample,
        entity: ["Customer", "Building"].sample,
        number_and_street: address.street,
        suite_and_apartment: address.street.split(" ")[0],
        city: address.city,
        postal_code: address.zip,
        country: "USA",
        notes: Faker::Lorem.sentence(word_count: rand(3..9).floor),
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30')
    )
end

123.times {


    users = User.create!(
        email: Faker::Internet.unique.email,
        password: "password",
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30'),
        is_admin: TRUE
    )

    customers = Customer.create!(

        company_name: [Faker::Name.last_name + " " + Faker::Company.suffix, Faker::Restaurant.name, Faker::University.name, Faker::Space.agency].sample,
        company_contact_name: Faker::Name.name, 
        contact_phone: Faker::PhoneNumber.cell_phone, 
        contact_email: users[:email],
        company_description: Faker::Company.catch_phrase, 
        service_tech_name: Faker::Name.name, 
        service_tech_phone: Faker::PhoneNumber.cell_phone, 
        service_tech_email: Faker::Internet.unique.email, 
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30'),
        address_id: Faker::Number.between(from: 1, to: 100),
        user_id: users[:id]
    )

    
}


179.times do
    buildings = Building.create!(
        admin_name: Faker::Name.name, 
        admin_email: Faker::Internet.unique.email, 
        admin_phone_numer: Faker::PhoneNumber.cell_phone, 
        tech_full_name: Faker::Name.name, 
        tech_email: Faker::Internet.unique.email, 
        tech_phone_number: Faker::PhoneNumber.cell_phone,
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30'),
        address_id: Faker::Number.between(from: 1, to: 100),
        customer_id: Faker::Number.between(from: 1, to: 123) 
    )
end

186.times do
    building_details = BuildingDetail.create!(
        information_key: Faker::Number.number(digits: 10), 
        value: Faker::Number.between(from: 1000000, to: 7999999),
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30'), 
        building_id: Faker::Number.between(from: 1, to: 179)
    )
end


214.times do
    batteries = Battery.create!(

        battery_type: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
        status: ["Active", "Inactive", "Intervention"].sample, 
        date_of_commissioning: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'), 
        date_of_last_inspection: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'), 
        certificate_of_operations: 'Certified',
        information: Faker::Lorem.sentence(word_count: 11),
        notes: Faker::Lorem.sentence(word_count: rand(5..10).floor),
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30'),
        building_id: Faker::Number.between(from: 1, to: 179),
        employee_id: Faker::Number.between(from: 1, to: 21) 
    )
end

363.times do
    columns = Column.create!(
        column_type: ['Commercial', 'Residential', 'Corporate',].sample, 
        number_of_floor: Faker::Number.decimal_part(digits: 2), 
        status: ["Active", "Inactive", "Intervention"].sample, 
        information: Faker::Lorem.sentence(word_count: rand(3..12).floor),
        notes: Faker::Quote.yoda,
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30'),
        battery_id: Faker::Number.between(from: 1, to: 214)
    )
end

573.times do
    elevators = Elevator.create!(
        serial_number: Faker::Number.number(digits: 10),
        model: ['Standard', 'Premium', 'Excelium'].sample, 
        elevator_type: ['Commercial', 'Residential', 'Corporate',].sample, 
        status: ["Active", "Inactive", "Intervention"].sample,
        date_of_commissioning: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'), 
        date_of_last_inspection: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'), 
        certificate_of_inspection: ['Yes', 'No'].sample, 
        notes: Faker::Quote.yoda,
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2021-01-01', to: '2021-10-30'),
        column_id: Faker::Number.between(from: 1, to: 363)
    )
end


125.times do 
    buildingType = "Residential"
    servicesType = ["Standard", "Premium", "Excelium"].sample
    numApt = rand(2..1000)
    numFlr = rand(2..100)
    numBas = rand(2..10)
    shaftSQty = (numApt.to_f / (numFlr.to_f * 6)).ceil()
    columnsQty = (numFlr.to_f / 20).ceil()
    amntElevtr = shaftSQty * columnsQty

    if servicesType == "Standard"
        standard = 0.11
        priceElevtr = 7565
        elevatorTotal = 7565 * amntElevtr
        iFees = (standard * elevatorTotal).round(2)
        total = elevatorTotal + iFees
     
    elsif servicesType == "Premium"
        premium = 0.13
        priceElevtr = 12345
        elevatorTotal = 12345 * amntElevtr
        iFees = (premium * elevatorTotal).round(2) 
        total = elevatorTotal + iFees
        
    elsif servicesType == "Excelium"
        excelium = 0.16
        priceElevtr = 15400
        elevatorTotal = 15400 * amntElevtr
        iFees = (excelium * elevatorTotal).round(2)  
        total = elevatorTotal + iFees
    end

    quotes = Quote.create!(
        company_name: [Faker::Restaurant.name, Faker::University.name, Faker::Space.agency].sample,
        email: Faker::Internet.email(domain: 'business'),
        phone_number: Faker::PhoneNumber.cell_phone,
        building_type: buildingType,
        apartments: numApt,
        floors: numFlr,
        basements: numBas,
        services_type: servicesType,
        amount_of_elevator: amntElevtr,
        price_per_elevator: '$' + priceElevtr.to_s,
        installation: '$' + iFees.to_s,
        price_elevator_total: '$' + elevatorTotal.to_s,
        total_price: '$' + total.to_s,
        created_at: Faker::Date.between(from: '2018-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2018-09-23', to: '2021-09-25')
    )

end


89.times do 
    buildingType = "Commercial"
    servicesType = ["Standard", "Premium", "Excelium"].sample
    numFlr = rand(2..100)
    numBas = rand(2..10)
    numCompanies = rand(2..100)
    numParking = rand(2..100)
    numElevators = rand(1..50)
    amntElevtr = numElevators
    

    if servicesType == "Standard"
        standard = 0.11
        priceElevtr = 7565
        elevatorTotal = 7565 * amntElevtr
        iFees = (standard * elevatorTotal).round(2)
        total = elevatorTotal + iFees
     
    elsif servicesType == "Premium"
        premium = 0.13
        priceElevtr = 12345
        elevatorTotal = 12345 * amntElevtr
        iFees = (premium * elevatorTotal).round(2)
        total = elevatorTotal + iFees
        
    elsif servicesType == "Excelium"
        excelium = 0.16
        priceElevtr = 15400
        elevatorTotal = 15400 * amntElevtr
        iFees = (excelium * elevatorTotal).round(2) 
        total = elevatorTotal + iFees
    end

    quotes = Quote.create!(
        company_name: [Faker::Restaurant.name, Faker::University.name, Faker::Space.agency].sample,
        email: Faker::Internet.email(domain: 'business'),
        phone_number: Faker::PhoneNumber.cell_phone,
        building_type: buildingType,
        floors: numFlr,
        basements: numBas,
        elevators: numElevators,
        companies: numCompanies,
        parking_spots: numParking,
        services_type: servicesType,
        amount_of_elevator: amntElevtr,
        price_per_elevator: '$' + priceElevtr.to_s,
        installation: '$' + iFees.to_s,
        price_elevator_total: '$' + elevatorTotal.to_s,
        total_price: '$' + total.to_s,
        created_at: Faker::Date.between(from: '2018-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2018-09-23', to: '2021-09-25')
    )

end


140.times do 
    buildingType = "Corporate"
    servicesType = ["Standard", "Premium", "Excelium"].sample
    numFlr = rand(2..300)
    numBas = rand(2..20)
    numCorp = rand(2..100)
    numParking = rand(2..100)
    numOcc = rand(1..100)

    totalFloorsNum = numFlr + numBas
    totalOccupantsNum = totalFloorsNum * numOcc
    shaftsQty = (totalOccupantsNum.to_f / 1000).ceil()
    columnsQty = (totalFloorsNum.to_f / 20).ceil()
    shaftsPerColumn = (shaftsQty.to_f / columnsQty.to_f).ceil()
    amntElevtr = columnsQty * shaftsPerColumn

    if servicesType == "Standard"
        standard = 0.11
        priceElevtr = 7565
        elevatorTotal = 7565 * amntElevtr
        iFees = (standard * elevatorTotal).round(2)
        total = elevatorTotal + iFees
     
    elsif servicesType == "Premium"
        premium = 0.13
        priceElevtr = 12345
        elevatorTotal = 12345 * amntElevtr
        iFees = (premium * elevatorTotal).round(2)
        total = elevatorTotal + iFees
        
    elsif servicesType == "Excelium"
        excelium = 0.16
        priceElevtr = 15400
        elevatorTotal = 15400 * amntElevtr
        iFees = (excelium * elevatorTotal).round(2) 
        total = elevatorTotal + iFees
    end

    quotes = Quote.create!(
        company_name: [Faker::Restaurant.name, Faker::University.name, Faker::Space.agency].sample,
        email: Faker::Internet.email(domain: 'business'),
        phone_number: Faker::PhoneNumber.cell_phone,
        building_type: buildingType,
        floors: numFlr,
        basements: numBas,
        parking_spots: numParking,
        corporations: numCorp,
        maximum_occupancy: numOcc,
        services_type: servicesType,
        amount_of_elevator: amntElevtr,
        price_per_elevator: '$' + priceElevtr.to_s,
        installation: '$' + iFees.to_s,
        price_elevator_total: '$' + elevatorTotal.to_s,
        total_price: '$' + total.to_s,
        created_at: Faker::Date.between(from: '2018-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2018-09-23', to: '2021-09-25') 
    )

end


60.times do 
    buildingType = "Hybrid"
    servicesType = ["Standard", "Premium", "Excelium"].sample
    numFlr = rand(2..300)
    numBas = rand(2..20)
    numCompanies = rand(2..100)
    numParking = rand(2..100)
    numOcc = rand(1..10)
    numHours = rand(1..24)
    totalFloorsNum = numFlr + numBas
    totalOccupantsNum = totalFloorsNum * numOcc
    shaftsQty = (totalOccupantsNum.to_f / 1000).ceil()
    columnsQty = (totalFloorsNum.to_f / 20).ceil()
    shaftsPerColumn = (shaftsQty.to_f / columnsQty.to_f).ceil()
    amntElevtr = columnsQty * shaftsPerColumn

    if servicesType == "Standard"
        standard = 0.11
        priceElevtr = 7565
        elevatorTotal = 7565 * amntElevtr
        iFees = (standard * elevatorTotal).round(2)
        total = elevatorTotal + iFees
     
    elsif servicesType == "Premium"
        premium = 0.13
        priceElevtr = 12345
        elevatorTotal = 12345 * amntElevtr
        iFees = (premium * elevatorTotal).round(2)
        total = elevatorTotal + iFees
        
    elsif servicesType == "Excelium"
        excelium = 0.16
        priceElevtr = 15400
        elevatorTotal = 15400 * amntElevtr
        iFees = (excelium * elevatorTotal).round(2) 
        total = elevatorTotal + iFees
    end

    quotes = Quote.create!(
        company_name: [Faker::Restaurant.name, Faker::University.name, Faker::Space.agency].sample,
        email: Faker::Internet.email(domain: 'business'),
        phone_number: Faker::PhoneNumber.cell_phone,
        building_type: buildingType,
        floors: numFlr,
        basements: numBas,
        companies: numCompanies,
        parking_spots: numParking,
        maximum_occupancy: numOcc,
        business_hours: numHours,
        services_type: servicesType,
        amount_of_elevator: amntElevtr,
        price_per_elevator: '$' + priceElevtr.to_s,
        installation: '$' + iFees.to_s,
        price_elevator_total: '$' + elevatorTotal.to_s,
        total_price: '$' + total.to_s,
        created_at: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'),
        updated_at: Faker::Date.between(from: '2018-09-23', to: '2021-09-25') 
    )

end





puts "Seeding Done!"
