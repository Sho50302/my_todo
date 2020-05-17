# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    # super
    @user = User.new
  end

  # POST /resource
  def create
    # super
    @user = User.create(user_params)
    if @user.save
      # sign_up後ログイン状態が維持できないとき以下の記述をする
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  # GET /resource/edit
  # super
  def edit
    @user = User.find(current_user.id)
  end

  # PUT /resource
  # super
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # DELETE /resource
  # super
  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to new_user_session_path
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def after_update_path_for(resource)
    root_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   tasks_path
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   tasks_path
  # end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :user_image)
  end
end
