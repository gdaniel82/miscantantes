class DisksController < ApplicationController
  before_action :set_disk, only: [:show, :edit, :update, :destroy]

  # GET /disks
  # GET /disks.json
  def index
    if params[:id] == nil
      @disks = Disk.all
    else
      @disks = Disk.where(singer_id: params[:id]) 
    end
  end

  # GET /disks/1
  # GET /disks/1.json
  def show
  end

  # GET /disks/new
  def new
    @list_singers = Singer.all
    @disk = Disk.new
  end

  # GET /disks/1/edit
  def edit
    @list_singers = Singer.all
  end

  # POST /disks
  # POST /disks.json
  def create
    @disk = Disk.new(disk_params)

    respond_to do |format|
      if @disk.save
        format.html { redirect_to @disk, notice: 'Disk was successfully created.' }
        format.json { render :show, status: :created, location: @disk }
      else
        @list_singers = Singer.all
        format.html { render :new }
        format.json { render json: @disk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disks/1
  # PATCH/PUT /disks/1.json
  def update
    respond_to do |format|
      if @disk.update(disk_params)
        format.html { redirect_to @disk, notice: 'Disk was successfully updated.' }
        format.json { render :show, status: :ok, location: @disk }
      else
        format.html { render :edit }
        format.json { render json: @disk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disks/1
  # DELETE /disks/1.json
  def destroy
    @disk.destroy
    respond_to do |format|
      format.html { redirect_to disks_url, notice: 'Disk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disk
      @disk = Disk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disk_params
      params.require(:disk).permit(:singer_id, :name, :description)
    end
end
