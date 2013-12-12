class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: :edit
  before_action :require_signed

  def require_permission
    if current_user != User.find(@person.user_id)
      flash[:notice] = "Não tem autorização para editar estes dados. :)"
      redirect_to person_path(current_user)
    end
  end

  # GET /people
  # GET /people.json
  def index
	@search = Person.search do
		fulltext params[:search]
	end
    @people = @search.results
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new(:person_id => @user.id)
  end


  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
      @user = User.find(params[:id])
      @contacts = Contact.all
      @articles = @user.article
      @abilitys = @user.ability
      @courses = @user.course
      @jobs = @user.job

      @user_contacts = Array.new
      @contacts.each do |c|
        if c.user_id == @user.id  || c.user2_id == @user.id
          @user_contacts.push(c)
        end
      end

      @user_contacts_accepted = Array.new
      @user_contacts.each do |c|
        if c.state == "Aceite"
          @user_contacts_accepted.push(c)
        end
      end

      @coworkers = Array.new
      if !(@jobs.size)==0
        @coworkers = Enterprise.find(@jobs.last.enterprise_id).job
      end
      @privacy = @person.privacy

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:user_id, :name, :birthday_date, :city, :phone, :quote, :privacy, :avatar)
    end
end
