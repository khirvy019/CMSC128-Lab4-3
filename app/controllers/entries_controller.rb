require 'Time'

class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
	@new_entry = Entry.new
    @entries = Entry.all
	@x = 0
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
	redirect_to entries_path
  end

  # GET /entries/new
  def new
	redirect_to entries_path
    @new_entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
	redirect_to entries_path
  end

  # POST /entries
  # POST /entries.json
  def create
	if(entry_params["sender"] == '' and entry_params["message"] == '')
		respond_to do |format|
			format.html { redirect_to entries_path, notice: 'Entry was unsuccessfully created.' }
		end
	else
		buff = entry_params
		if(buff["sender"] == '')
			buff["sender"] = "Anonymous"
		end
		@entry = Entry.new(buff)
		respond_to do |format|
		  if @entry.save
			format.html { redirect_to entries_path, notice: 'Entry was successfully created.' }
		  end
		end
	end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:sender, :message)
    end
end
