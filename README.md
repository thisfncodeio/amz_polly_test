# README



### Instructions to run the program

First, you need a copy a database.yml file, which will specify your database information. Add this file to the config folder. A copy of the database.yml file is here https://github.com/dominhannguyen/database-yml

Next, include a copy of application.yml file, this file should be placed inside the config folder, which specifies the API key.

```

# Add configuration values here, as shown below.
#
# pusher_app_id: "2954"
# pusher_key: 7381a978f7dd7f9a1117
# pusher_secret: abdc3b896a0ffb85d373
# stripe_api_key: sk_test_2J0l093xOyW72XUYJHE4Dv2r
# stripe_publishable_key: pk_test_ro9jV5SNwGb1yYlQfzG17LHK
#
# production:
#   stripe_api_key: sk_live_EeHnL644i6zo4Iyq4v1KdV9H
#   stripe_publishable_key: pk_live_9lcthxpSIHbGwmdO941O1XVU


```



Next, open your ubuntu terminal and run this command to install the dependencies:

```bundle install```

Third, run this command to set up your databases:

```rails db:setup```

Finally, run this command:

```rails server ```

You can now see the website at a web browser at localhost:3000


### Back Office Admin Logins
Nicolas Genest | CEO | nicolas.genest@codeboxx.biz | password: password

Nadya Fortier | Director | nadya.fortier@codeboxx.biz | password: password

Martin Chantal | Director Assistant | martin.chantal@codeboxx.biz | password: password

Mathieu Houde | Captain | mathieu.houde@codeboxx.biz | password: password

Abdul Akeeb | Developer | abdul.akeeb@codeboxx.biz | password: password

Timothy Wever | Developer | timothy.wever@codeboxx.biz | password: password

Krista Sheely | Developer | krista.sheely@codeboxx.biz | password: password 

## Week 10 - TDD  ============================================

## Project Description 

This week we apply unit testings to our Information System, using a framework call RSPEC.

### To run the test
```
rspec spec

```



## Week 9 - Consolidation ===================================


## Project Description
This week our task is to build the whole Rocket Elevator Information System on inidivual basis. It also includes a REST API and GRAPHQL API to query useful informtion.




## REST API Endpoint: https://rocket-domin-elevator.azurewebsites.net/interventions

 1. Retrieving a list of pending interventions:
    https://rocket-domin-elevator.azurewebsites.net/interventions
 2. Change the status of a intervention to "InProgress" and add the start date of the intervention 
    
  In Postman body: {"id": "1", "status": "InProgress" } method: PUT
  
 3. Change the status of a intervention to "Completed" and add the end date of the intervention 
    
  In Postman body: {"id": "1", "status": "Completed" } method: PUT
  
  
  
  
  ### GRAPHQL API endpoint: https://rocket-graphql-elevator.herokuapp.com/graphql
  
  1. Retrieving a list of pending interventions:

```

{
 pending_interventions {
 	id
	status
	start_date
	end_date
 }
}


```
  2. Change the status of a intervention to "InProgress" and add the start date to the intervention 

```

mutation {	
	 update_intervention_start_date(id: 7) {
		id
		status
		start_date
		end_date
	 }
}


```
3. Change the status of a intervention to "Completed" and add the end date to the intervention 

```

mutation {	
	 update_intervention_end_date(id: 7) {
		id
		status
		start_date
		end_date
	 }
}

```






### API implemented:

- Google Maps: We used ``` gem 'geocoder' ``` m to convert the addresses to latitude and longitude
- Twilio: We used gem ``` 'gem 'twilio-ruby', '~> 5.61.0' ``` to integrate twilio to our apps
- Slack: We used gem ``` gem 'slack-notifier' ``` to integrate slack to our apps
- Dropbox: We used gem ``` gem 'dropbox_api' ``` to integrate slack to our apps
- SendGrid: We used gem ``` gem 'sendgrid-ruby' ``` and ``` gem 'sendgrid-actionmailer' ```  to integrate Sendgrid to our apps
- Amazon Polly: We used gem ``` gem 'aws-sdk-polly' ``` to integrate Amazon Polly to our apps
- Zendesk: We used gem ``` gem "zendesk_api" ``` to integrate slack to our apps


### Ruby / Rails version
We used Ruby 2.6.6 and Ruby on Rails 5.2.6


### Author
 <strong>Do Minh An Nguyen</strong> <br />

