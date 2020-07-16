class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_one :payment
  accepts_nested_attributes_for :payment # registration new form


  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first_or_create do |user|
      user.email = auth['info']['email']
      user.password = Devise.friendly_token[0, 20]
      user.name = auth['info']['name']
      user.avatar = auth['info']['image']
    end
  end

end
