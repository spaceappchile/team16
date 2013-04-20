class MobileUsersController < ApplicationController
  # GET /mobile_users
  # GET /mobile_users.json
  def index
    @mobile_users = MobileUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mobile_users }
    end
  end

  # GET /mobile_users/1
  # GET /mobile_users/1.json
  def show
    @mobile_user = MobileUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mobile_user }
    end
  end

  # GET /mobile_users/new
  # GET /mobile_users/new.json
  def new
    @mobile_user = MobileUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mobile_user }
    end
  end

  # GET /mobile_users/1/edit
  def edit
    @mobile_user = MobileUser.find(params[:id])
  end

  # POST /mobile_users
  # POST /mobile_users.json
  def create
    @mobile_user = MobileUser.new(params[:mobile_user])

    respond_to do |format|
      if @mobile_user.save
        format.html { redirect_to @mobile_user, notice: 'Mobile user was successfully created.' }
        format.json { render json: @mobile_user, status: :created, location: @mobile_user }
      else
        format.html { render action: "new" }
        format.json { render json: @mobile_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mobile_users/1
  # PUT /mobile_users/1.json
  def update
    @mobile_user = MobileUser.find(params[:id])

    respond_to do |format|
      if @mobile_user.update_attributes(params[:mobile_user])
        format.html { redirect_to @mobile_user, notice: 'Mobile user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mobile_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobile_users/1
  # DELETE /mobile_users/1.json
  def destroy
    @mobile_user = MobileUser.find(params[:id])
    @mobile_user.destroy

    respond_to do |format|
      format.html { redirect_to mobile_users_url }
      format.json { head :no_content }
    end
  end
end
