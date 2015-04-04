class Channel < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 80 }
  validates :description, presence: true
  validates :image, presence: true

  before_save :generate_slug, :generate_token

  mount_uploader :image, BannerUploader

  private

  def generate_slug
    self.slug = self.name.parameterize
  end

  def generate_token
     self.token = SecureRandom.hex(20)
  end

end
