class RegisteredApplication < ActiveRecord::Base
  validates :url, uniqueness: true, presence: true
  
  belongs_to :user
  has_many :events, dependent: :destroy

  before_validation :fix_url

  scope :visible_to, -> (user) { RegisteredApplication.where(user: user) }

  private

  def fix_url
    unless url.match(/https?:\/\//)
      self.url = "http://#{self.url}"
    end
  end
end
