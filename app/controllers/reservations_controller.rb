class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.where(:room_id => Room.first.id)
    @rooms = Room.all
    if (params.has_key?(:room_id))
      @reservations = Reservation.where(:room_id => room_params[:room_id])
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @p = reservation_params
    @rezerwacje = Reservation.where(:room_id=>reservation_params[:room_id])
    @ds = DateTime.new(reservation_params["date_start(1i)"].to_i,
                       reservation_params["date_start(2i)"].to_i,
                       reservation_params["date_start(3i)"].to_i,
                       reservation_params["date_start(4i)"].to_i,
                       reservation_params["date_start(5i)"].to_i)
    @dk = DateTime.new(reservation_params["date_stop(1i)"].to_i,
                       reservation_params["date_stop(2i)"].to_i,
                       reservation_params["date_stop(3i)"].to_i,
                       reservation_params["date_stop(4i)"].to_i,
                       reservation_params["date_stop(5i)"].to_i)
    test = 0
    if @ds < @dk
      @rezerwacje.each do |rezerwacje|
        @dsa = rezerwacje.date_start
        @dka = rezerwacje.date_stop
        if @ds > @dsa and @ds < @dka
          test = 1
          break
        end

        if @dk > @dsa and @dk < @dka
          test = 1
          break
        end

        if @ds <= @dsa and @dk >= @dka
          test = 1
          break
        end
      end
      if test == 0
        @reservation = Reservation.new(reservation_params)
        respond_to do |format|
          if @reservation.save
            format.html { redirect_to @reservation, notice: 'Rezerwacja utworzona pomyślnie.' }
            format.json { render :show, status: :created, location: @reservation }
          else
            format.html { render :new }
            format.json { render json: @reservation.errors, status: :unprocessable_entity }
          end
        end
      else redirect_to new_reservation_path, alert: 'Sala zajęta.'
      end
    else redirect_to new_reservation_path, alert: 'Data początku wieksza lub równa niż data końca.'
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:date_start, :date_stop, :user_id, :room_id)
    end

  def room_params
    params.permit(:room_id)
  end
end
