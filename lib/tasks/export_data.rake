require 'pg'
require 'date'
require 'faker'

namespace :export_data do
    desc "export data from mysql and import it into pgsql"
    task :mysql => :environment do

        puts "Exporting data from mySQL server..."
        connection = PG::Connection.open(host: "localhost", port: 5432, dbname: "myapp_development", user: "root", password: "password")

        connection.exec("TRUNCATE fact_contacts RESTART IDENTITY")
        Lead.all.each do |lead|
            connection.exec("INSERT INTO \"fact_contacts\" (id, creation_date, company_name, email, project_name) 
            VALUES ('#{lead.id}', '#{lead.created_at}', '#{lead.company_name.gsub("'", "''")}', '#{lead.email}', '#{lead.project_name.gsub("'", "''")}')")
        end

        
        connection.exec("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |quote|
            connection.exec("INSERT INTO \"fact_quotes\" (id, creation_date, company_name, email, number_of_elevators) 
            VALUES ('#{quote.id}', '#{quote.created_at}', '#{quote.company_name.gsub("'", "''")}', '#{quote.email}', '#{quote.amount_of_elevator}')")
        end

        puts "Importing data to PostgreSQL.."
        connection.exec("TRUNCATE fact_elevators RESTART IDENTITY")
        Elevator.all.each do |elevator|
            connection.exec("INSERT INTO \"fact_elevators\" (id, serial_number, date_of_commissionning, building_id, customer_id, building_city) 
            VALUES ('#{elevator.id}', '#{elevator.serial_number}', '#{elevator.date_of_commissioning}', '#{elevator.column.battery.building_id}', '#{elevator.column.battery.building.customer_id}', '#{elevator.column.battery.building.address.city}')")
        end

        connection.exec("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |quote|
            connection.exec("INSERT INTO \"fact_quotes\" (id, creation_date, company_name, email, number_of_elevators) 
            VALUES ('#{quote.id}', '#{quote.created_at}', '#{quote.company_name.gsub("'", "''")}', '#{quote.email}', '#{quote.amount_of_elevator}')")
        end


        connection.exec("TRUNCATE dim_customers RESTART IDENTITY")
        Customer.all.each do |customer|
            elevatorCount = 0
            customer.buildings.all.each do |building| 
                building.batteries.all.each do |battery|
                    battery.columns.all.each do |column|
                        elevatorCount =+ column.elevators.count
                    end
                end
            end
            connection.exec("INSERT INTO \"dim_customers\" (id, creation_date, company_name, main_contact_full_name, main_contact_email, number_of_elevators, customer_city)
            VALUES ('#{customer.id}', '#{customer.created_at}', '#{customer.company_name.gsub("'", "''")}', '#{customer.company_contact_name.gsub("'", "''")}', '#{customer.contact_email}', '#{elevatorCount}', '#{customer.address.city.gsub("'", "''")}')")
        end

        connection.exec("TRUNCATE fact_interventions RESTART IDENTITY")
        Building.all.each do |building|
            building.batteries.all.each do |battery|
                if (battery.status == "Intervention")
                    random_year = rand(2017..2021)
                    random_month = rand(1..12)
                    random_date = rand(1..22)
                    intervention_status = ["Pending","In Progress","Interrupted","Resumed","Complete"].sample
                    intervention_start_date = Date.new(random_year, random_month, random_date).to_datetime
            
                    if (intervention_status == "Complete")
                        intervention_end_date = Date.new(random_year, random_month, random_date+3).to_datetime
                        intervention_result = ["Success","Failure"].sample
                        if (intervention_result == "Success")
                            report = "This is working "
                        else 
                            report = "This is NOT working"
                        end

                    else
                        intervention_result = "Incomplete"
                        intervention_end_date = nil
                    end

                    connection.exec_params("INSERT INTO \"fact_interventions\" (employee_id, building_id, battery_id, column_id, elevator_id, intervention_start_time, intervention_end_time, result, report, status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)", [battery.employee_id, building.id, battery.id, nil, nil, intervention_start_date, intervention_end_date, intervention_result, report, intervention_status])

                end

                battery.columns.all.each do |column|
                    if (column.status == "Intervention") 
                        random_year = rand(2017..2021)
                        random_month = rand(1..12)
                        random_date = rand(1..22)
                        intervention_status = ["Pending","In Progress","Interrupted","Resumed","Complete"].sample
                        intervention_start_date = Date.new(random_year, random_month, random_date).to_datetime

                        if (intervention_status == "Complete")
                            intervention_end_date = Date.new(random_year, random_month, random_date+3).to_datetime
                            intervention_result = ["Success","Failure"].sample
                            if (intervention_result == "Success")
                                intervention_report = "This is working "
                            else 
                                intervention_report = "This is NOT working"
                            end
    
                        else
                            intervention_result = "Incomplete"
                            intervention_end_date = nil
                        end
    
                        connection.exec_params("INSERT INTO \"fact_interventions\" (employee_id, building_id, battery_id, column_id, elevator_id, intervention_start_time, intervention_end_time, result, report, status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)", [battery.employee_id, building.id, battery.id, column.id, nil, intervention_start_date, intervention_end_date, intervention_result, intervention_report, intervention_status])

                    end

                    column.elevators.all.each do |elevator|
                        if (elevator.status == "Intervention")
                            random_year = rand(2017..2021)
                            random_month = rand(1..12)
                            random_date = rand(1..22)
                            intervention_status = ["Pending","In Progress","Interrupted","Resumed","Complete"].sample
                            intervention_start_date = Date.new(random_year, random_month, random_date).to_datetime
    
                            if (intervention_status == "Complete")
                                intervention_end_date = Date.new(random_year, random_month, random_date+3).to_datetime
                                intervention_result = ["Success","Failure"].sample
                                if (intervention_result == "Success")
                                    intervention_report = "This is working "
                                else 
                                    intervention_report = "This is NOT working"
                                end
        
                            else
                                intervention_result = "Incomplete"
                                intervention_end_date = nil
                            end
        
                            connection.exec_params("INSERT INTO \"fact_interventions\" (employee_id, building_id, battery_id, column_id, elevator_id, intervention_start_time, intervention_end_time, result, report, status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)", [battery.employee_id, building.id, battery.id, column.id, elevator.id, intervention_start_date, intervention_end_date, intervention_result, intervention_report, intervention_status])
    
                        end

                    end

                end

            end


        end



        puts "Done!"
    end

end
