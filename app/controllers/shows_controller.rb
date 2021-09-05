class ShowsController < ApplicationController

  get "/shows" do
    # render all shows as json
    # binding.pry
    Show.all.to_json(include: [:characters])
  end

  get "/shows/:id" do
    find_shows
    shows_to_json
  end

  post "/shows" do
    # binding.pry
    @show = Show.new(params)
    if @show.save
      # return object as json if saved
      shows_to_json
    else
      # return error message if not saved
      shows_errors_messages
    end
  end

  patch "/shows/:id" do
    find_shows
    if show.update(params)
      shows_to_json
    else
     shows_errors_messages
    end
  end

  delete "/shows/:id" do
    find_shows
    if @show
      @show.destroy
      @show.to_json
    else
      { errors: ["Show Doesn't Exist"] }.to_json
    end
  end

  private
  def find_shows
    @show = Show.find_by_id(params["id"])
  end

  def shows_to_json
    @show.to_json(include: [:characters])
  end

  def shows_errors_messages
    { errors: @show.errors.full_messages }.to_json
  end

end
