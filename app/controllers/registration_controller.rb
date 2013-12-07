#class RegistrationController < ApplicationController

class RegistrationController < Devise::RegistrationsController

  def new
    @user= User.new
    @person = Person.new
  end

  def create

    @user = User.new
    @user.person_id = params[:user][:person_id]
    #@user.person_id = @user.id
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation]

    @person = Person.new
    #@person.id = @user.id
    @person.name = params[:person][:name]
    @person.birthday_date = params[:person][:birthday_date]
    @person.city = params[:person][:city]
    @person.phone = params[:person][:phone]
    @person.quote = params[:person][:quote]
    @person.privacy = params[:person][:privacy]
	@person.avatar = params[:person][:avatar]
    @user.valid?
    if @user.errors.blank?

      @user.save
     @person.user = @user
      @person.save
      redirect_to people_path
    else
      render :action => "new"
    end
  end

end
