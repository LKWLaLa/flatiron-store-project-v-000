class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  

  def current_cart=(cart)
    if !cart.nil?
      self.current_cart_id = cart.id
      @current_cart = cart
      self.save
    end
  end

  def current_cart
    @current_cart = Cart.find_by(id: self.current_cart_id)
  end  

end
