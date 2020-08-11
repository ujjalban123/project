class DevisesController < ApplicationController
  before_action :set_devise, only: [:show, :edit, :update, :destroy]

  # GET /devises
  # GET /devises.json
  def index
    @devises = Devise.all
  end

  # GET /devises/1
  # GET /devises/1.json
  def show
  end

  # GET /devises/new
  def new
    @devise = Devise.new
  end

  # GET /devises/1/edit
  def edit
  end

  # POST /devises
  # POST /devises.json
  def create
    @devise = Devise.new(devise_params)

    respond_to do |format|
      if @devise.save
        format.html { redirect_to @devise, notice: 'Devise was successfully created.' }
        format.json { render :show, status: :created, location: @devise }
      else
        format.html { render :new }
        format.json { render json: @devise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devises/1
  # PATCH/PUT /devises/1.json
  def update
    respond_to do |format|
      if @devise.update(devise_params)
        format.html { redirect_to @devise, notice: 'Devise was successfully updated.' }
        format.json { render :show, status: :ok, location: @devise }
      else
        format.html { render :edit }
        format.json { render json: @devise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devises/1
  # DELETE /devises/1.json
  def destroy
    @devise.destroy
    respond_to do |format|
      format.html { redirect_to devises_url, notice: 'Devise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devise
      @devise = Devise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def devise_params
      params.require(:devise).permit(:edit)
    end
end
