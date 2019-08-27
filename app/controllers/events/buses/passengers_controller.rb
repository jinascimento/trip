class Events::Buses::PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]

  # GET /passengers/1
  # GET /passengers/1.json
  def show
    #
  end

  # GET /passengers/new
  def new
    bus = Bus.find(params[:bus_id])
    @passenger = bus.passengers.build
  end

  # GET /passengers/1/edit
  def edit; end

  def create
    bus = Bus.find(params[:bus_id])
    @passenger = bus.passengers.build(passenger_params)

    respond_to do |format|
      if @passenger.save
        format.html { redirect_to event_bus_path(bus.event, bus), notice: 'Passenger was successfully created.' }
        format.json { render :show, status: :created, location: @passenger }
      else
        format.html { render :new }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passengers/1
  # PATCH/PUT /passengers/1.json
  def update
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to event_bus_passenger_path(@passenger.bus.event, @passenger.bus, @passenger),
                                  notice: 'Passenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1
  # DELETE /passengers/1.json
  def destroy
    bus = @passenger.bus
    @passenger.destroy
    respond_to do |format|
      format.html { redirect_to event_bus_path(bus.event, bus), notice: 'Passenger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    passengers = Passenger.where("name ILIKE ?", "%#{params[:term]}%").map{|item| {id: item.id, name: item.name}}

    respond_to do |format|
      format.json do
        render json: passengers
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_passenger
    bus = Bus.includes(:passengers).where(buses: { id: params[:bus_id] },
                                          passengers: { id: params[:id] }).first
    @passenger = bus.passengers.first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def passenger_params
    params.require(:passenger).permit(:name, :birthdate, :national_registry_code, :bus_id, :email)
  end
end