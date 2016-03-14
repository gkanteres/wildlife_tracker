class ReportController < ApplicationController
  def index
    @sightings = Sighting.all
  end
end
