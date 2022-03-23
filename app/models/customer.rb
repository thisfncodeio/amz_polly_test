
class Customer < ApplicationRecord
    belongs_to :address
    belongs_to :user, optional: true
    has_many :buildings
    after_create :just_created

    private

    def just_created

      @client = DropboxApi::Client.new(ENV['dropbox_token'])
      
      # @result = @client.get_temporary_link '/micro/Screen Shot 2021-11-18 at 3.24.34 PM.png'
      # puts @result.link
      # puts links.map.methods - Object.methods
      # puts links.map.next.methods - Object.methods

      # expect(folder).to be_a(DropboxApi::Metadata::SharedFolder)

      # folder = @client.share_folder('/micro')

      
         Lead.all.each do |found_lead|
                if found_lead.email == contact_email
                  
              
                  email = contact_email
                  filename = found_lead.filename
                 
                      if filename.nil? == false
                        if filename != '' 
                            
                            folders = DropboxApi::Client.new(ENV['dropbox_token'])
                            
                            previous_attachement = found_lead.attachment
                            folders.upload "/" + email  +"/"+ filename, previous_attachement ,:mode => :add
                            found_lead.attachment = ''
                            found_lead.filename =''
                            found_lead.save
                        end
                      end
              end
          end
          
     
    
    end
 
end
