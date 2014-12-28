class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  respond_to :html, :js

  def index
    @items = Item.incomplete
    @items_completed = Item.complete
    @item = Item.new
    respond_with(@items, @items_completed, @item)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    respond_with(@item) do |format|
      format.html { redirect_to [@item] }
    end
  end

  def update
    @item.update_attribute(:complete, true)
    # @item.complete = true
    # @item.save
    respond_with(@item)
  end

  def destroy
    if @item.destroy
      @message = "Item was deleted."
    else
      @message = "Item could not be deleted."
    end
    respond_with(@item) do |format|
      format.html { redirect_to [@item] }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :body)
    end
end
