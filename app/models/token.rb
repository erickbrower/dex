class Token < ActiveRecord::Base
  attr_accessible :is_active, :user_id, :value

  belongs_to :user

  before_create :generate_token

  def active?
    @is_active
  end

  def active=(val)
    @is_active = val
  end

  private
  def generate_token
    @value = SecureRandom.uuid.gsub(/-/, '')
  end
end
