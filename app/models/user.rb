class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #scope :active, -> { where(active: true) }

  def name
    full_name
  end

  def full_name
    (self.first_name + ' ' + self.last_name).titleize
  end
end
