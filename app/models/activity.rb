class Activity < ActiveRecord::Base
  serialize :run_detail
  attr_accessible :provider, :activity_type,
                  :activity_id, :duration, :distance,
                  :activity_date, :user_id, :run_detail,
                  :detail_present
  belongs_to :user
  validates_presence_of :duration, :distance, :activity_id, :user_id

end