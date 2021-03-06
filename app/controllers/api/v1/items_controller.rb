class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml
  before_action :authenticate, except: [:index, :show]

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    respond_with Item.create(item_params)
  end

  def update
    respond_with Item.update(params[:id], item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end

  def authenticate
    authenticate_or_request_with_http_basic('Please authenticate to use API') do |email, password|
      user = User.find_by(email: email)

      return true if user && user.authenticate(password)
    end
  end
end
