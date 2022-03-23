class ThankYouMailer < ApplicationMailer

    default :from => 'dominhan.nguyen@gmail.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_thank_you_email(lead)
        @lead = lead
        mail( :to => @lead.email,
        :subject => 'Your Message Has Been Submitted',
        :template_id => 'd-658f7d86ebd545389ccf80b0268dc7e9',
        :dynamic_template_data => {
            full_name: @lead.full_name,
            project_name: @lead.project_name
        }    
    )
    end
end
