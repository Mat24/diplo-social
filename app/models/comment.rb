class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  # Area de validaciones
  validates :body, presence: true

end
