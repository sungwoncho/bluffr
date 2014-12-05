class Bluff < ActiveRecord::Base
  validates_length_of :statement_1, maximum: 90
  validates_length_of :statement_2, maximum: 90
end