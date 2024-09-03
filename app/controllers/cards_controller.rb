class CardsController < ApplicationController
  require 'net/http'

  # GET /cards
  def index
    @cards = MtgCard.all
    render json: @cards
  end

  # POST /cards
  def create
    @card = MtgCard.new(card_params)

    if @card.save
      render json: @card, status: :created
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # GET /cards/search
  def search
    query = params[:q]
    uri = URI("https://api.scryfall.com/cards/search?q=#{query}")
    response = Net::HTTP.get(uri)
    render json: JSON.parse(response)
  end

  private

  def card_params
    params.require(:card).permit(:name, :set, :image_url)
  end
end
