class ShowsController < ApplicationController
  def index
    @shows = Show.all.map(&:name)
    if params[:search].present?
      @show = Show.find_by(name: params[:search])
      respond_to do |format|
        format.html
        format.text { render partial: "shows/results", locals: { show: @show }, formats: [:html] }
      end
    else
      @show = Show.new
    end
  end
end
