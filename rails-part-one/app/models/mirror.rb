class Mirror < ApplicationRecord
	has_many :members, dependent: :destroy
end
