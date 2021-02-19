class Performance < ApplicationRecord
  belongs_to :user
  attachment :image
end
