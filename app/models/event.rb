class Event < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :registered_application
end
