class User < ActiveRecord::Base

  has_secure_password({ validations: false })

  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 15 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }, confirmation: true, :unless => lambda { |v| v.validate_password? }
  validates :level, presence: true

  def validate_password?
    password.blank? && password_confirmation.blank? && !self.new_record?
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
