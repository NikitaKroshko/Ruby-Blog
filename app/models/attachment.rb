class Attachment < ApplicationRecord
  has_many_attached :images
  has_many_attached :videos
  has_many_attached :audios
end
