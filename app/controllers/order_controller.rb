class OrderController < ApplicationController
    def create
        # FIXME: remove from prdouct stock
        @order = current_user.orders.new
        if @order.save
            @cart_products = current_user.shopping_cart.cart_products
            # @cart_products.each(&:save!).order_products.new
            @cart_products.each do |p|
                @order.order_products.create(quantity: p.quantity, product_id: p.product_id, price: Product.find_by_id(p.product_id).price)
                Product.find_by_id(p.id).decrement(:stock).save!
            end
            redirect_to @order, notice: 'Order was successfully created.'
        else 
            redirect_to shopping_cart_path, alert: 'Order not created.'
        end
    end

    def show
      @order = Order.find(params[:id])
    end

    private
        def order_params
            params.require(:order).permit()
        end 
end
