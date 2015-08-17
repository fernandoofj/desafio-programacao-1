class Customer < ActiveRecord::Base
  def self.find_or_create(name)
    self.find_by(name: name) || self.create(name: name)
  end
end
