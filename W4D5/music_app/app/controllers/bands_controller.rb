class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to bands_url
        else
            flash[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def new
        render :new
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def edit
        @band = Band.find(params[:id])
        render :edit
    end

    def update
        @band = Band.find(params[:id])
        if @band.update_attributes(band_params)
            redirect_to band_url(@band)
        else
            puts "error in updating"
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
    end

    def destroy
        Band.find(params[:id]).delete
        redirect_to bands_url
    end

    def band_params
        params.require(:band).permit(:name)
    end
end
