class OrdersController < ApplicationController
  def new
    @order = Order.new
    @products = Product.all
    @products.each{ |product| @order.order_items.build(product: product) }
  end

  def create
    @order = Order.new(order_params)

    ActiveRecord::Base.transaction do
      if @order.save
        process_order_items
        redirect_to products_path, notice: '注文が完了しました。'
      else
        raise ActiveRecord::Rollback, @order.errors.full_messages.to_sentence
      end
    rescue => e
      @products = Product.all
      flash[:alert] = '注文に失敗しました：#{e.message}'
      render :new, status: :unprocessable_entity
    end
  end


  def history
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, order_items_attributes: [:product_id, :quantity, :price])
  end

  def process_order_items
    @order.order_items.each do |item|
      product = item.product
      if product.stock_quantity >= item.quantity
        product.update!(stock_quantity: product.stock_quantity - item.quantity)
      else
        raise ActiveRecord::Rollback, "在庫不足： #{product.name}"
      end
    end
  end
end
