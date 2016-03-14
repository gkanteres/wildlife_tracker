class ReportController < ApplicationController
  def index
    start_date = params[:start_date]
    end_date = params[:end_date]
    query_string = ''
    query_hash = {}
    start_date_string = 'date >= :start_date'
    end_date_string = 'date <= :end_date'

    if start_date.present? && end_date.present?
      query_string = [start_date_string, end_date_string].join(' AND ')
      query_hash = {
        start_date: start_date,
        end_date: end_date
      }
    elsif start_date.present?
      query_string = start_date_string
      query_hash = {
        start_date: start_date
      }
    elsif end_date.present?
      query_string = end_date_string
      query_hash = {
        end_date: end_date
      }
    else
      @sightings = Sighting.all
      return
    end

    @sightings = Sighting.where(query_string, query_hash)
  end
end
