class PackagesController < ApplicationController
  before_action :set_package, only: %i[ show edit update destroy ]

  # GET /packages or /packages.json
  def index
    @packages = Package.all
  end

  # GET /packages/1 or /packages/1.json
  def show
  end

  # GET /packages/new
  def new
    @package = Package.new
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages or /packages.json
  def create
    @package = Package.new(package_params)

    if @package.save
      redirect_to @package.courier, notice: "Package was successfully created."
    else
      redirect_to @package.courier, notice: "Package was NOT successfully created."
    end
  end

  # PATCH/PUT /packages/1 or /packages/1.json
  def update
      if @package.update(package_params)
        redirect_to @package.courier, notice: "Package was successfully updated."
      else
        redirect_to @package.courier, notice: "Package was NOT successfully updated."
      end
  end

  # DELETE /packages/1 or /packages/1.json
  def destroy
    courier = @package.courier
    @package.destroy
    
    redirect_to courier, notice: "Package was successfully destroyed." 
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def package_params
      params.require(:package).permit(:track_number, :delivery_status, :courier_id)
    end
end
