class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destroy]

    def index
        #Entry.where("created_at >= Date.today")
        @entries = Entry.all
    end

    def show
    end

    def new
        @entry = Entry.new
    end

     # GET /entries/1/edit
    def edit
    end

    def create
        @entry = Entry.new(entry_params)
    
        respond_to do |format|
          if @entry.save
            format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
            format.json { render :show, status: :created, location: @entry }
          else
            format.html { render :new }
            format.json { render json: @entry.errors, status: :unprocessable_entity }
          end
        end
      end

    def destroy
      @entry.destroy
      respond_to do |format|
        format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end 

    private
    #Use callbacks to share common setup between actions
    def set_entry
      @entry = Entry.find(params[:id])
    end
    
    #param validation
    def entry_params
      params.require(:entry).permit(:meal_type, :calories, :proteins, :carbo, :fats                                                                                                                                                                                                                                                      , :fats)
    end
end
