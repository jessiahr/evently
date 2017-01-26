class Event < ActiveRecord::Base
  default_scope { order(timestamp: :desc) } #used to sort by default
  scope :by_organization_id, -> (organization_id) {
    where(organization_id: organization_id)
  }
  scope :by_hostname, -> (hostname) { where(hostname: hostname) }
  belongs_to :organization

  validates :organization_id, presence: true
end
