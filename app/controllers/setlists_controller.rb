class SetlistsController < ApplicationController

	def index
		@setlists = Setlist.all
	end

	def new
		@setlist = Setlist.new
	end

	def show
		@setlist = Setlist.find(params[:id])
	end

	def create
		@setlist = Setlist.new(params[:setlist])
	
		if @setlist.save
			redirect_to @setlist, notice: 'Setlist successfully saved.'
		else
			render action: 'new'
		end
	end

	def edit
		@setlist = Setlist.find(params[:id])
	end

	def update
		@setlist = Setlist.find(params[:id])
    
    if params[:add_song].present?
      @setlist.songs.push Song.find(params[:add_song])
      @setlist.save
      redirect_to setlist_path, notice: 'Setlist updated'

    elsif params[:remove_song].present?
     	@setlist.songs.delete(Song.find(params[:remove_song]))
     	if @setlist.save
     		redirect_to setlist_path, notice: 'Song removed, setlist updated.'
     	else
     		render :show, error: 'Unable to remove song'
     	end
     	
    else
		  if @setlist.update_attributes(params[:setlist])
  			redirect_to setlist_path, notice: 'Setlist updated'
  		else
  			render action: 'update'
  		end
  	end
	end

	def destroy
		@setlist = Setlist.find(params[:id])
		@setlist.destroy

		redirect_to setlists_path, notice: 'Setlist deleted.'
	end

end