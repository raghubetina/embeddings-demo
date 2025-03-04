class ThingsController < ApplicationController
  def index
    matching_things = Thing.all

    @list_of_things = matching_things.order({ :created_at => :desc })

    render({ :template => "things/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_things = Thing.where({ :id => the_id })

    @the_thing = matching_things.at(0)

    render({ :template => "things/show" })
  end

  def create
    the_thing = Thing.new
    the_thing.description = params.fetch("query_description")

    if the_thing.valid?
      the_thing.save
      redirect_to("/things", { :notice => "Thing created successfully." })
    else
      redirect_to("/things", { :alert => the_thing.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_thing = Thing.where({ :id => the_id }).at(0)

    the_thing.description = params.fetch("query_description")

    if the_thing.valid?
      the_thing.save
      redirect_to("/things/#{the_thing.id}", { :notice => "Thing updated successfully."} )
    else
      redirect_to("/things/#{the_thing.id}", { :alert => the_thing.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_thing = Thing.where({ :id => the_id }).at(0)

    the_thing.destroy

    redirect_to("/things", { :notice => "Thing deleted successfully."} )
  end
end
