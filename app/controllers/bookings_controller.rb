class BookingsController < ApplicationController
  def new
  end

  def import
    CsvImport.new(params[:file]).call
  end

  def index
  end
end
