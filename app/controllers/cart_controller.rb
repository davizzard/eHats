class CartController < ApplicationController
  def addprod
    product_exists = false
    unless session[:productquantities].blank?
      session[:productquantities].each do |element|
        if element["product_id"] == params[:product_id].to_i
          element["quantity"] = element["quantity"] + params[:quantity].to_i
          if element["quantity"] > 30
            element["quantity"] = 30
          end
          product_exists = true
        end
      end
    end
    unless product_exists
      pq = ProductQuantity.create(product_id: params[:product_id], order_id: nil, quantity: params[:quantity])
      (session[:productquantities] ||= []) << pq
    end
    session[:message] = "Se ha añadido el producto a su cesta"
    redirect_to cart_path
  end

  def updprod
    session[:productquantities].each do |element|
      if element["product_id"] == params[:product_id].to_i
        element["quantity"] = params[:quantity].to_i
        p = Product.find(params[:product_id])
        session[:message] = "La cantidad del producto: " + p.name +  " se ha cambiado a " + params[:quantity]
      end
    end
    redirect_to cart_path
  end

  def deleteprod
    session[:productquantities].each_with_index do |element, n|
      if element["product_id"] == params[:product_id].to_i
        session[:productquantities].delete_at(n)
        session[:message] = "Se ha eleminado el producto de su cesta con éxito"
      end
    end
    redirect_to cart_path
  end

end
