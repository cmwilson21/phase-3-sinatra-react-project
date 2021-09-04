class ShowsController < ApplicationController

  get "/shows" do
    # render all shows as json
    # binding.pry
    Show.all.to_json(include: [:characters])
  end

  get "/shows/:id" do
    show = Show.find_by_id(params["id"])
    show.to_json(include: [:characters])
  end

  post "/shows" do
    # binding.pry
    show = Show.new(params)
    if show.save
      # return object as json if saved
      show.to_json(include: [:characters])
    else
      # return error message if not saved
      { errors: show.errors.full_messages }.to_json
    end
  end

  patch "/shows/:id" do
    show = Show.find_by_id(params["id"])
    binding.pry
    if show.update(params)
      show.to_json(include: [:characters])
    else
      { errors: show.errors.full_messages }.to_json
    end
  end

  delete "/shows/:id" do
    show = Show.find_by_id(params["id"])
    if show
      show.destroy
      show.to_json
    else
      { errors: ["Show Doesn't Exist"] }.to_json
    end
  end


end
