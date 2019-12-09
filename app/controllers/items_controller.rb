class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.all.order("created_at DESC")
    @q = Item.ransack(params[:q])

  end


  def search
    @q = Item.ransack(params[:q])
    @items = @q.result()
    if params[:item] && params[:item][:brand_id]
      @items = @q.result().where(brand_id: params[:item][:brand_id])
    end
    if params[:category_ids]
      @items = @q.result().where(category_id: params[:category_ids])
    end
  end



  def new
    @item = Item.new
  end

  def show
    
  end

  def create
    @item = Item.create(item_params)
    image_params[:image].each do |img|
      @item.images.create(image: img)
    end
  end

  def  destroy
    if @item.destroy
      # @item.category.update(items_size: @item.category.items.size)
      # redirect_to listing_user_path(current_user.id)
      redirect_to root_path(current_user.id)

    else
      render :edit
    end
  end


  
  private
  def item_params
    params.require(:item).permit(
      :title, :description, :prefecture_id, :shipping_charger_id, :shipping_method_id,
      :days_to_ship_id, :item_status_id, :price
    ).merge( trade_status_id: 1)
  end

  def image_params
    params.require(:item_images).permit(image: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
