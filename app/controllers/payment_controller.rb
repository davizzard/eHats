class PaymentController < ApplicationController
  def express_checkout
    if user_signed_in?
      @order = Order.new(:express_token => params[:token], total_price: params[:total_price].to_f, payed: false)
      session[:productquantities].each do |element|
        pq = ProductQuantity.create(product_id: element["product_id"], order_id: @order.id, quantity: element["quantity"])
        (@order.product_quantities ||= []) << pq
      end
      @order.ip = request.remote_ip
      @order.save

      @user = User.find(current_user.id)
      (@user.orders ||= []) << @order
      @user.save

      total_price = ActionController::Base.helpers.number_with_precision(params[:total_price].to_f * 100, precision: 0).to_i

      response = EXPRESS_GATEWAY.setup_purchase(total_price,
                                                ip: request.remote_ip,
                                                return_url: "http://304d7bb5.ngrok.io/checkout_details",
                                                cancel_return_url: "http://304d7bb5.ngrok.io",
                                                currency: "EUR",
                                                allow_guest_checkout: true,
                                                items: [{name: "Order", description: "Order description", quantity: "1", amount: total_price}])
      redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
    else
      session[:message] = "Debe iniciar sesión para tramitar el pedido"
      redirect_to new_user_session_path
    end
  end

  def checkout_details
    @token = params[:token]
    @payer_id = params[:PayerID]
    @details = EXPRESS_GATEWAY.details_for(@token)
  end

  def purchase
    total_price = 0
    if user_signed_in?
      @user = User.find(current_user.id)
      @user.orders.each do |order|
        unless order.payed
          @tok = params[:token]
          @pid = params[:PayerID]
          total_price = ActionController::Base.helpers.number_with_precision(order.total_price * 100, precision: 0).to_i
          @order = order
        end
      end
    end

    @result = EXPRESS_GATEWAY.purchase(total_price, {
        :token => @tok,
        :payer_id => @pid,
        :currency => "EUR"
    })
    if @result
      session[:productquantities] = nil
      unless @order.blank?
        @order.payed = true
        @order.save
      end
    end

    @user.orders.each do |order|
      unless order.payed
        order.destroy
      end
    end
  end

end
