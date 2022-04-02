class User < ApplicationRecord
  after_create :assign_default_role
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
    email
  end

  after_create do
    customer = Stripe::Customer.create(email: email)
    update(stripe_customer_id: customer.id)
  end

  def assign_default_role
    self.add_role(:User) if self.roles.blank?
  end
  
end
