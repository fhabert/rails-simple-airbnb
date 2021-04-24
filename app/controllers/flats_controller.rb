class FlatsController < ApplicationController
    def index
        if params[:input]
            @flats = Flat.where("name LIKE '#{params[:input]} %'")
            @counter = Flat.where("name LIKE '#{params[:param1]} %'").count
        else
            @flats = Flat.all
            @counter = Flat.count
        end
    end

    def create
        @flat = Flat.new(flat_params)
        if @flat.save
            redirect_to flats_path
        else
            render :new
        end
    end

    def new
        @flat = Flat.new()
    end

    def destroy
        @flat = Flat.find(params[:id])
        @flat.destroy
        redirect_to flats_path
    end

    def show
        @flat = Flat.find(params[:id])
    end

    def update
        @flat = Flat.find(params[:id])
        @flat.update(flat_params)
        redirect_to flats_path
    end

    def edit
        @flat = Flat.find(params[:id])
    end

    private

    def flat_params
        params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :url)
    end
end
