class Member < ApplicationRecord
  belongs_to :mirror
  
  enum activity: [
    :home,
    :work,
    :school,
    :groceries,
    :shopping,
    :partying,
    :adventure,
    :unknown,
    :eating,
    :mortal_peril,
  ]

end
