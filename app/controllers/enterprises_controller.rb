class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: :edit
  before_action :require_signed

  def require_permission
    if current_user != User.find(@enterprise.admin_id)
      flash[:notice] = "Não tem autorização para editar estes dados. :)"
      redirect_to enterprise_path(@enterprise)
    end
  end

  # GET /enterprises
  # GET /enterprises.json
  def index
    @enterprises = Enterprise.all
  end

  # GET /enterprises/1
  # GET /enterprises/1.json
  def show
  end

  # GET /enterprises/new
  def new
    @enterprise = Enterprise.new
  end

  # GET /enterprises/1/edit
  def edit
  end

  # POST /enterprises
  # POST /enterprises.json
  def create
    @enterprise = Enterprise.new(enterprise_params)

    respond_to do |format|
      if @enterprise.save
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @enterprise }
      else
        format.html { render action: 'new' }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enterprises/1
  # PATCH/PUT /enterprises/1.json
  def update
    respond_to do |format|
      if @enterprise.update(enterprise_params)
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enterprises/1
  # DELETE /enterprises/1.json
  def destroy
    @enterprise.destroy
    respond_to do |format|
      format.html { redirect_to enterprises_url }
      format.json { head :no_content }
    end
  end

  def enterpriseByUser
    @user = User.find(current_user.id)
    @enterprises = Enterprise.all
    @jobs = Array.new
    @user.job.each do |j|
      @jobs.push(j)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
      @workers = Array.new
      @enterprise.job.each do |j|
          @workers.push(j)
      end

      @admin_conections = Array.new
      Contact.all.each do |c|
        if c.user_id == @enterprise.admin_id
          @admin_conections.push(Person.find(c.user2_id))
        elsif c.user2_id == @enterprise.admin_id
          @admin_conections.push(Person.find(c.user_id))
        end
      end

      @admin_conections = Array.new
      @enterprise.job.each do |c|
        @admin_conections.push(Person.find(c.user_id))
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enterprise_params
      params.require(:enterprise).permit(:name, :history, :foundation, :email, :phone, :address, :areas, :projectos, :admin_id, :attachment, :slogan, :website)
    end


end
