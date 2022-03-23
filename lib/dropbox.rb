require "rails_admin/config/actions"
require "rails_admin/config/actions/base"
module RailsAdmin
  @test_var="Hello, World"
    module Config
      module Actions
        class MyObject
          attr_accessor :customer_email, :links, :links_filename

          def initialize
            self.links = []
            self.links_filename = []
          end
        end
        class Dropbox < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
  
          register_instance_option :collection do
            true
          end
  
          register_instance_option :http_methods do
            [:get, :post]
          end
  
          register_instance_option :controller do
            proc do
              
              @client = DropboxApi::Client.new(ENV['dropbox_token'])
              
             @customer_object_array = []
              
              Customer.all.each do |customer|
                @customer_object = MyObject.new
                @link = []
                @customer_object.links = []
                @customer_object.links_filename = []
                begin
                  @result2 = @client.list_folder '/'+customer.contact_email
                 
                  @customer_object.customer_email = customer.contact_email
                  @result2.entries.each do |resource|
                      @result = @client.get_temporary_link resource.path_lower
                      @link.push(@result.link)
                      @filename_raw = resource.path_lower.split('/')
                      @filename_pretty = @filename_raw.last
                      
                      @customer_object.links.push(@result.link)
                      @customer_object.links_filename.push(@filename_pretty)
                     
                      
                  end
                  @customer_object_array.push(@customer_object)
                rescue Exception => e # Never do this!
                  
                end
                
              
               
              end
              # puts @customer_object.links
              
              # puts @result.link
              
              # puts @link
              if format = params[:json] && :json || params[:csv] && :csv || params[:xml] && :xml
                request.format = format
                @schema = HashHelper.symbolize(params[:schema].slice(:except, :include, :methods, :only).permit!.to_h) if params[:schema] # to_json and to_xml expect symbols for keys AND values.
                @objects = list_entries(@model_config, :export)
                index
              else
                # render @action.template_name
              end
            end
          end
  
          register_instance_option :bulkable? do
            true
          end
  
          register_instance_option :link_icon do
            'fas fa-file-export'
          end
          
        end
      end
    end
  end