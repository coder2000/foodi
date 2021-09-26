# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token

  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  Devise.omniauth_configs.keys.each do |provider|
    define_method provider do
      redirect_to root_path, alert: "Something went wrong. Please try again." if auth.nil?

      if identity.present?
        handle_existing_identity(identity)
      elsif user_signed_in?
        attach_identity
      elsif User.exists?(email: auth.info.email)
        redirect_to new_user_session_path, alert: "You already have an account with this email. Please sign in."
      else
        create_user
      end
    end
  end

  private

  def auth
    @auth ||= request.env["omniauth.auth"]
  end

  def identity
    @identity ||= Identity.from_omniauth(auth)
  end

  def handle_existing_identity(identity)
    identity.update(identity_params)

    if user_signed_in?
      redirect_to root_path, notice: "Successfully linked #{auth.provider.capitalize} account."
    else
      sign_in_and_redirect identity.user, event: :authentication
    end
  end

  def attach_identity
    current_user.identities.create(identity_params)
    redirect_to root_path, notice: "Successfully linked #{auth.provider.capitalize} account."
  end

  def create_user
    user = User.new(
      email: auth.info.email,
      password: Devise.friendly_token[0, 20],
      name: auth.info.name
    )
    user.skip_confirmation!
    user.identities.build(identity_params)
    user.save!

    sign_in_and_redirect user, event: :authentication
  end

  def identity_params
    {
      uid: auth.uid,
      provider: auth.provider
    }
  end
end
