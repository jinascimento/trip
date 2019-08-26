class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @event.buses.build
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event criado com sucesso!' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    #
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Evento destruído com sucesso' }
      format.json { head :no_content }
    end
  end

  def edit
    #
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Evento atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, buses_attributes:
        %i[name armchair license_plate]
    )
  end
end