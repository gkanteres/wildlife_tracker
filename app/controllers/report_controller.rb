class ReportController < ApplicationController
  def index
    start_date = params[:start_date]
    end_date = params[:end_date]
    region_id = params[:region_id]
    query_string = ''
    query_hash = {}

    date_query_string = ''
    start_date_string = 'date >= :start_date'
    end_date_string = 'date <= :end_date'
    if start_date.present? && end_date.present?
      date_query_string = [start_date_string, end_date_string].join(' AND ')
      query_hash[:start_date] = start_date
      query_hash[:end_date] = end_date
    elsif start_date.present?
      date_query_string = start_date_string
      query_hash[:start_date] = start_date
    elsif end_date.present?
      date_query_string = end_date_string
      query_hash[:end_date] = end_date
    end

    region_query_string = ''
    if region_id.present?
      region_query_string = 'region_id = :region_id'
      query_hash[:region_id] = region_id
    end
    
    if date_query_string.present? && region_query_string.present?
      query_string = [date_query_string, region_query_string].join(' AND ')
      @sightings = Sighting.where(query_string, query_hash)
    elsif date_query_string.present?
      @sightings = Sighting.where(date_query_string, query_hash)
    elsif region_query_string.present?
      @sightings = Sighting.where(region_query_string, query_hash)
    else
      @sightings = Sighting.all
    end
  end
end
