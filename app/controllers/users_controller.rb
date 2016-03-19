class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_url, notice: "Bienvenido a Diplo social "
    else
      render "new"
    end
  end

  private

  # Metodo para filtrar los parametros que lleguen del formulario, la internet es peligrosa!
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end


