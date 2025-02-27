class PlacesController < ApplicationController

  def index
    # find all Place rows
    @places = Place.all
  end

  def show
    # find a Place
    @place = Place.find_by({ "id" => params["id"] })
    
    # find Entries for the Place
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
    
  end

  def create
    # start with a new Place
    @place = Place.new

    # assign user-entered form data to Place's columns
    @place["name"] = params["name"]

    # save Place row
    @place.save

    # redirect user
    redirect_to "/places"
  end

end
