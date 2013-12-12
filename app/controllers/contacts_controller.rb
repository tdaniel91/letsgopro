class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :require_permission, only: :edit
  before_action :require_signed

  def require_permission
    if ((current_user != User.find(@contact.user_id)) && (current_user != User.find(@contact.user2_id)) )
      flash[:notice] = "Não tem autorização para editar estes dados. :)"
      redirect_to contacts_path
    end
  end

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all

    @user = current_user
    @user_contacts = Array.new
    @contacts.each do |c|
      if c.user_id == @user.id  || c.user2_id == @user.id
        @user_contacts.push(c)
      end
    end

    @user_contacts_accepted = Array.new
    @user_contacts_pending = Array.new
    @user_contacts.each do |c|
      if c.state == "Aceite"
        @user_contacts_accepted.push(c)
      end
      if c.state == "Pendente"
        @user_contacts_pending.push(c)
      end

    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    if params.has_key? :user2_id
      @contact = Contact.new(:user_id => current_user.id, :user2_id => params[:user2_id], :state => "pending")
    else
      @contact = Contact.new
    end
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:user_id, :user2_id, :state)
    end
end
