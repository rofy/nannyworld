class Evidence < ActiveRecord::Base
  has_attached_file :media
  belongs_to :wrapper
end