class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_article

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



  def set_article
    if user_signed_in?
      @art = Array.new
      @con = Array.new
      Contact.all.each do |c|
        if c.state == "accepted"
          if c.user_id == current_user.id
            @con.push(Person.find(c))
          elsif c.user2_id == current_user.id
            @con.push(Person.find(c))
          end
          Article.all.each do |a|
            if (@con.map(&:user_id).include?(a.user_id))
              @art.push(a)
            end
          end
        end
      end
    end
  end
end


