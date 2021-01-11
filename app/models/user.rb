class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  has_one :cart
  has_many :orders, through: :cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  
  validates :first_name, :last_name, :phone_number, presence: true
  

  STATE = ['Alabama','Alaska','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida','Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virgin Island','Virginia','Washington','West Virginia','Wisconsin','Wyoming']

  def self.create_from_provider_data(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    first_name = auth.info.name.split(" ")[0]
    last_name = auth.info.name.split(" ")[1]

    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.first_name = first_name
    user.last_name = last_name
    user.phone_number = "please add valid phone number"
  end      
end

  def name
   name = "#{first_name} #{last_name}"
  end

end
