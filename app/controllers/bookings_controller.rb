class BookingsController < ApplicationController
  def new
  end

  def import
    if params[:file].nil?
      raise_alert("Pas de fichier ajouté")
    else
      CsvImport.new(params[:file]).call
    end
  end

  private

  def raise_alert(message)
    flash[:alert] = message
    return redirect_to root_path()
  end
end
