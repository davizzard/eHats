class Order < ApplicationRecord
  belongs_to :user
  has_many :product_quantities
  has_many :products, through: :product_quantities

  def purchase

  end

  def express_token=(token)
    self[:express_token] = token
    if new_record? && !token.blank?
      # you can dump details var if you need more info from buyer
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
    end
  end


end
