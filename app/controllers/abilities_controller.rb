class AbilitiesController < ApplicationController
  before_action :set_ability, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: :edit
  before_action :require_signed

  def require_permission
    if current_user != User.find(@ability.user_id)
      flash[:notice] = "Não tem autorização para editar estes dados. :)"
      redirect_to person_path(current_user)
    end
  end
  # GET /abilities
  # GET /abilities.json
  def index
    @abilities = Ability.all
  end

  # GET /abilities/1
  # GET /abilities/1.json
  def show
  end

  # GET /abilities/new
  def new
    @ability = Ability.new
  end

  # GET /abilities/1/edit
  def edit
  end

  # POST /abilities
  # POST /abilities.json
  def create
    @ability = Ability.new(ability_params)

    respond_to do |format|
      if @ability.save
        format.html { redirect_to @ability, notice: 'Ability was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ability }
      else
        format.html { render action: 'new' }
        format.json { render json: @ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abilities/1
  # PATCH/PUT /abilities/1.json
  def update
    respond_to do |format|
      if @ability.update(ability_params)
        format.html { redirect_to @ability, notice: 'Ability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abilities/1
  # DELETE /abilities/1.json
  def destroy
    @ability.destroy
    respond_to do |format|
      format.html { redirect_to abilities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ability
      @ability = Ability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ability_params
      params.require(:ability).permit(:user_id, :name)
    end
end
