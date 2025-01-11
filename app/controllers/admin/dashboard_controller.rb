module Admin
  class Admin::DashboardController < ApplicationController
    def index
      @products = Product.all
      @orders = Order.all
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_dashboard_path, notice: "商品を登録しました。"
      else
        @products = Product.all
        flash.now[:alert] = "商品を登録出来ませんでした。"
        render :index
      end
    end

    def destroy
      product = Product.find(params[:id])
      if product.destroy
        redirect_to admin_dashboard_path, notice: "商品#{product.name}を削除しました"
      else
        redirect_to admin_dashboard_path, alert: "商品を削除できませんでした。"
      end
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :stock_quantity)
    end
  end
end
