class Cart < ActiveRecord::Base
  
  has_many :cart_selections, :dependent => :destroy
  belongs_to :customer
  
  def subtotal
    total = 0
    self.cart_selections.each do |selection|
      if selection.product_id.present?
        total = (total + (selection.product.price*selection.quantity)).to_f
      end
      if self.customer.address.international?
        total = total + (3.95).to_f
      end
    end
    total
  end
  
  def items
    count = 0
    self.cart_selections.each do |selection|
      count = count + selection.quantity
    end
    count
  end
end
