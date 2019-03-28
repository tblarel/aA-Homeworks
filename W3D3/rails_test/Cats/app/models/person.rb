class Person < ActiveRecord::Base
  validates :name, :house_id, presence: true

  belongs_to (
    :houses
  )
end