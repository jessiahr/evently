class Organization < ActiveRecord::Base
  has_many :events, dependent: :destroy
  default_scope { order(created_at: :desc) }
end
