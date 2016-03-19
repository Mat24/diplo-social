class SessionsController < ApplicationController
  def new
    # Solo se dedica a renderizar vista
  end

  def create
    user = User.find_by(email: params[:email]) # Busco el usuario por el email
    if user and user.authenticate(params[:password]) # Si el usuario existe(fue encontrado), y el password es correcto, entonces:
      session[:user_id] = user.id # Guardo en las sesiones del servidor, el id del usuario para posteriores operaciones
      redirect_to root_url, notice: "Ha iniciado sesion satisfactoriamente!" # Redireccione a la ruta raiz y muestre un mensaje
    else
      flash.now.alert = "email o contraseña invalidos" # Muestre un mensaje de error
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Sesion terminada satisfactoriamente!"
  end
end
