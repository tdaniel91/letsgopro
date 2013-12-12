class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def require_signed
    if !user_signed_in?

      flash[:notice] = "Faça log in para aproveitar ao máximo o Let's go Pro!"
      redirect_to root_path
    end
  end

  def require_permission
    if current_user != User.find(params[:id])
      flash[:notice] = "Não tem autorização para editar estes dados. :)"
      redirect_to root_path
    end
  end

end
