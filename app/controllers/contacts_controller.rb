class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: :edit

  def require_permission
    if current_user != User.find(params[:id])
      redirect_to root_path
      #Or do something else here
    end
  end

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    if params.has_key? :user2_id
      @contact = Contact.new(:user_id => current_user.id, :user2_id => params[:user2_id], :state => "pending")
      @contact2 = Contact.new(:user_id => @user2, :user2_id => current_user.id, :state => "pending")
    else
      @contact = Contact.new
    end
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create                                                                            #TODO trocar user_id com user2_id na segunda linha
    #@contact = Contact.new(contact_params)
    @contact = Contact.new(:user_id => current_user.id, :user2_id => @user2,  :state => "pending")
    @contact = Contact.new(contact_params)
    @contact.save
    @contact2 = Contact.new(:user_id => @user2, :user2_id => current_user.id, :state => "pending")
    @contact2 = Contact.new(contact_params)
    #@contact2.save


    respond_to do |format|
      if @contact2.save
        format.html { redirect_to @contact2, notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact2 }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact2.errors, status: :unprocessable_entity }
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
      @user2 = params[:user2_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:user_id, :user2_id, :state)
    end
end
