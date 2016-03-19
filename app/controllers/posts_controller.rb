class PostsController < ApplicationController
  # Metodo callback para requerir un usuario logueado
  # se ejecuatara antes de cada ves que se consuma un recurso
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
