class Address < ActiveRecord::Base
  belongs_to :contact
  validates_presence_of :street, :state, :city
end
