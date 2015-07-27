class OrdersController < ApplicationController

  def index
    @orders = Order.all

    respond_to do |format|
      format.html { @orders }
      format.json { render :json => @orders }
      format.xml { render :xml => @orders }
    end
  end

  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html { @order }
      format.json { render :json => @order }
      format.xml { render :xml => @order }
    end
  end
end
