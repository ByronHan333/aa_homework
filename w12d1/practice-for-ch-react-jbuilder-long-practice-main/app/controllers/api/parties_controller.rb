class Api::PartiesController < ApplicationController
  def index
    @parties = Party.all
    render :index
  end

  def show
    # @party = Party.find(params[:id])
    @party = Party.includes(guests: [:gifts]).find(params[:id])

    render :show
    # render :normalized_show
  end
end