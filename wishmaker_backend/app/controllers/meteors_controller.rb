class MeteorsController < ApplicationController
  # GET /meteors
  # GET /meteors.json
  def index
    @meteors = Meteor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meteors }
    end
  end

  # GET /meteors/1
  # GET /meteors/1.json
  def show
    @meteor = Meteor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meteor }
    end
  end

  # GET /meteors/new
  # GET /meteors/new.json
  def new
    @meteor = Meteor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meteor }
    end
  end

  # GET /meteors/1/edit
  def edit
    @meteor = Meteor.find(params[:id])
  end

  # POST /meteors
  # POST /meteors.json
  def create
    @meteor = Meteor.new(params[:meteor])

    respond_to do |format|
      if @meteor.save
        format.html { redirect_to @meteor, notice: 'Meteor was successfully created.' }
        format.json { render json: @meteor, status: :created, location: @meteor }
      else
        format.html { render action: "new" }
        format.json { render json: @meteor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meteors/1
  # PUT /meteors/1.json
  def update
    @meteor = Meteor.find(params[:id])

    respond_to do |format|
      if @meteor.update_attributes(params[:meteor])
        format.html { redirect_to @meteor, notice: 'Meteor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meteor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meteors/1
  # DELETE /meteors/1.json
  def destroy
    @meteor = Meteor.find(params[:id])
    @meteor.destroy

    respond_to do |format|
      format.html { redirect_to meteors_url }
      format.json { head :no_content }
    end
  end
end
