class Organization < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  has_many :events, dependent: :destroy
end
