class Survey < ActiveRecord::Base
  belongs_to :user
  validates :first, :presence => { :if => 'first.nil?' }
end
