class GcmDevicesController < ApplicationController
  # GET /gcm_devices
  # GET /gcm_devices.json
  def index
    @gcm_devices = GcmDevice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gcm_devices }
    end
  end

  # GET /gcm_devices/1
  # GET /gcm_devices/1.json
  def show
    @gcm_device = GcmDevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gcm_device }
    end
  end

  # GET /gcm_devices/new
  # GET /gcm_devices/new.json
  def new
    @gcm_device = GcmDevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gcm_device }
    end
  end

  # GET /gcm_devices/1/edit
  def edit
    @gcm_device = GcmDevice.find(params[:id])
  end

  # POST /gcm_devices
  # POST /gcm_devices.json
  def create
    @gcm_device = GcmDevice.new(params[:gcm_device])

    respond_to do |format|
      if @gcm_device.save
        format.html { redirect_to @gcm_device, notice: 'Gcm device was successfully created.' }
        format.json { render json: @gcm_device, status: :created, location: @gcm_device }
      else
        format.html { render action: "new" }
        format.json { render json: @gcm_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gcm_devices/1
  # PUT /gcm_devices/1.json
  def update
    @gcm_device = GcmDevice.find(params[:id])

    respond_to do |format|
      if @gcm_device.update_attributes(params[:gcm_device])
        format.html { redirect_to @gcm_device, notice: 'Gcm device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gcm_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gcm_devices/1
  # DELETE /gcm_devices/1.json
  def destroy
    @gcm_device = GcmDevice.find(params[:id])
    @gcm_device.destroy

    respond_to do |format|
      format.html { redirect_to gcm_devices_url }
      format.json { head :no_content }
    end
  end
end
