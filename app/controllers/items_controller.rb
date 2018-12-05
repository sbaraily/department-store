class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  def index
    @item = Item.all
  end

  def show
  end

  def new
    @item = Item.new
    render partial: "form"
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :price, :size)
    end

    def set_item
      @item = Item.find(params[:id])
    end

end
