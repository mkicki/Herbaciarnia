class Tea < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1, maximum: 20}
  validates :country, presence: true, length: { minimum: 1, maximum: 20}
  validates :kind, presence: true, length: { minimum: 1, maximum: 20}
  mount_uploader :avatar, AvatarUploader
end