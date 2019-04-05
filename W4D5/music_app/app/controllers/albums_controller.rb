class AlbumsController < ApplicationController

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            flash[:errors] = @album.errors.full_messages
            redirect_to bands_url
        end
    end

    def new
        render :new
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def edit
        @album = Album.find(params[:id])
        render :edit
    end

    def update
         @album = Album.find(params[:id])
        if @album.update_attributes(album_params)
            redirect_to album_url(@album)
        else
            #puts "error in updating"
            #flash.now[:errors] = @album.errors.full_messages
            flash[:errors] = ["Testing error"]
            render :edit
        end
    end

    def destroy
        Album.find(params[:id]).delete
        redirect_to bands_url
    end

    private

    def album_params
        params.require(:album).permit(:name, :yr, :band_id, :recording_type)
    end

end
