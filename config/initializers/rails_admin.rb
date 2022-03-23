require Rails.root.join('lib', 'map.rb')
require Rails.root.join('lib', 'dropbox.rb')


RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless user_signed_in?
  end
  ### Popular gems integration

  # == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  config.model Customer do
    edit do
      field :company_name do
        required true
      end
      field :company_contact_name do
        required true
      end
      include_all_fields 
    end
  end
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export do
      except ['Customer']
    end
    bulk_delete
    show 
    edit
    delete
    show_in_app
    map do
      only ['Customer']
    end
    dropbox do
      only ['Customer']
    end
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

