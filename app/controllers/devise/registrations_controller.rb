class Devise::RegistrationsController < DeviseController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
​
  # GET /resource/sign_up
  def new
    build_resource
    yield resource if block_given?
    respond_with resource
  end
​
  # POST /resource
  def create
    build_resource(sign_up_params)
​
    resource.save
    yield resource if block_given?
    set_flash_message!(:notice, :signed_up)
    respond_with resource, location: after_sign_up_path_for(resource)
  end
​
  # GET /resource/edit
  # def edit
  #   super
  # end
​
  # PUT /resource
  # def update
  #   super
  # end
​
  # DELETE /resource
  # def destroy
  #   super
  # end
​
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
​
  protected
​
  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash = {})
    self.resource = resource_class.new_with_session(hash, session)
  end
​
  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end
​
  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end
​
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource) if is_navigational_format?
  end
​
  def translation_scope
    'devise.registrations'
  end
​
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
​
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
​
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end