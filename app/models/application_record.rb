class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  after_initialize
end
