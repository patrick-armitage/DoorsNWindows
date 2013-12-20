PublicActivity::Activity.class_eval do
  scope :recent, -> { where(:order => 'created_at DESC') }
  #bootstrap-will_paginate
  self.per_page = 10
end