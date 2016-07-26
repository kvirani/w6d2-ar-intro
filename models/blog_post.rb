class BlogPost < ActiveRecord::Base

  ## ASSOCIATIONS

  # Allows us to do: bp.user # => <User> || nil
  belongs_to :user

  ## VALIDATIONS

  validates :title, presence: true
  validates :user, presence: true


end