class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Metodo para obtener el usuario actualmente logueado
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  # Dejo el metodo 'current_user' al alcance de toda la aplicacion
  helper_method :current_user

  # Metodo bang para revisar que exista un usuario logeado,
  # si existe, no hace nada, de lo contrario redirecciona a la uri del login
  def authenticate_user!
    redirect_to login_path if !current_user
  end
end
