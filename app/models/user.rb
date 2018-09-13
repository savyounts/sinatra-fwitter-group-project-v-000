class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :email, presence: true

  def slug
    name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    self.find{|user| user.name.slug == slug}
  end
end
