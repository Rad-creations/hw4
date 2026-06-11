class EntriesController < ApplicationController

  def new
    if @current_user == nil
      redirect_to "/login"
    end
  end

  def create
    if @current_user != nil
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = @current_user["id"]
      @entry.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/places/#{params["place_id"]}"
  end

end