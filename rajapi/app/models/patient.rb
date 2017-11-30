class Patient < ActiveRecord::Base
	has_many :treatments
end
