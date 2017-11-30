class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @page = ( params[:page].to_i <= 0 ? 1 : params[:page].to_i )
    @per_page = ( params[:per].to_i <= 0 ? 10 : params[:per].to_i )
    # @offset = (@page - 1) * @per_page

    unless @per_page == 0
      @total = (Product.count / @per_page.to_f).ceil
    else
      @total = 0
    end

    unless params[:flood].to_i == 1
      @stores = Product.page(@page).per(@per_page)
    else
      @stores = Product.page(@page).per(Product.count)
    end
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

end
