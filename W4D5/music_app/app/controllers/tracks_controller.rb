class TracksController < ApplicationController

    def new
        render :new
    end

    def create
        @track = Track.new(track_params)
        if @track.save
            @album = Album.find(track_params[:album_id])
            flash[:errors] = @track.errors.full_messages
            redirect_to album_url(@album)
        else
            @album = Album.find(track_params[:album_id])
            flash[:errors] = @track.errors.full_messages
            redirect_to new_album_track_url(@album)
        end
    end


    private

    def track_params
        params.require(:track).permit(:title, :ord, :album_id, :track_type, :lyrics)
    end


end
