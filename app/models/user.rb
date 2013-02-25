class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates :email, presence: true, uniqueness: true

  has_many :tokens

  def self.authenticate(email, password)
    return find_by_email(email).try(:authenticate, password)
  end
end
