class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    @search = Search.new search_params
      if @search.save
        results = @search.get_location(@search.keywords)
        @search.save_location(results)
        @search.save
        redirect_to @search
      else
        render 'new'
      end
  end

  def show
    @search = Search.find params[:id]
    @results = @search.calculate_results(@search.latitude, @search.longitude, @search.distance)
  end

  private
  def search_params
    params.require(:search).permit(:search, :keywords, :latitude, :longitude, :distance)
  end

end
