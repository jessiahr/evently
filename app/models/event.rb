class Event < ActiveRecord::Base
  belongs_to :organization

  validates :organization_id, presence: true
  default_scope { order(timestamp: :desc) }
  scope :by_organization_id, -> (organization_id) {
    where(organization_id: organization_id)
  }
  scope :by_hostname, -> (hostname) { where(hostname: hostname) }
end
