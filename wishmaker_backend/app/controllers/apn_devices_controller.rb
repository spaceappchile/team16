class ApnDevicesController < ApplicationController
  # GET /apn_devices
  # GET /apn_devices.json
  def index
    @apn_devices = ApnDevice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apn_devices }
    end
  end

  # GET /apn_devices/1
  # GET /apn_devices/1.json
  def show
    @apn_device = ApnDevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apn_device }
    end
  end

  # GET /apn_devices/new
  # GET /apn_devices/new.json
  def new
    @apn_device = ApnDevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apn_device }
    end
  end

  # GET /apn_devices/1/edit
  def edit
    @apn_device = ApnDevice.find(params[:id])
  end

  # POST /apn_devices
  # POST /apn_devices.json
  def create
    @apn_device = ApnDevice.new(params[:apn_device])

    respond_to do |format|
      if @apn_device.save
        format.html { redirect_to @apn_device, notice: 'Apn device was successfully created.' }
        format.json { render json: @apn_device, status: :created, location: @apn_device }
      else
        format.html { render action: "new" }
        format.json { render json: @apn_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apn_devices/1
  # PUT /apn_devices/1.json
  def update
    @apn_device = ApnDevice.find(params[:id])

    respond_to do |format|
      if @apn_device.update_attributes(params[:apn_device])
        format.html { redirect_to @apn_device, notice: 'Apn device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apn_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apn_devices/1
  # DELETE /apn_devices/1.json
  def destroy
    @apn_device = ApnDevice.find(params[:id])
    @apn_device.destroy

    respond_to do |format|
      format.html { redirect_to apn_devices_url }
      format.json { head :no_content }
    end
  end
end
