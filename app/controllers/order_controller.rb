class OrderController < ApplicationController
  def express_checkout
    if user_signed_in?
      total_price = number_with_precision(params[:total_price].to_f * 100, precision: 0)

      response = EXPRESS_GATEWAY.setup_purchase(total_price,
                                                ip: request.remote_ip,
                                                return_url: "http://792c222e.ngrok.io/checkout_details",
                                                cancel_return_url: "http://792c222e.ngrok.io",
                                                currency: "EUR",
                                                allow_guest_checkout: true,
                                                items: [{name: "Order", description: "Order description", quantity: "1", amount: total_price}])
      redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
    else
      redirect_to new_user_session_path
    end
  end

  def checkout_details
    @token = params[:token]
    @payer_id = params[:PayerID]
    @details = EXPRESS_GATEWAY.details_for(@token)
  end

  def new
    @order = Order.new(:express_token => params[:token], total_price: params[:total_price].to_f)
  end

  def create
    @order.product_quantities << session[:productquantities]
    @order.user = User.find(current_user.id)
    @order.ip = request.remote_ip

    if @order.save
      if @order.purchase # this is where we purchase the order. refer to the model method below
        redirect_to order_url(@order)
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end
end
