class Person < ActiveRecord::Base
  validates :name, :house_id, presence: true

  belongs_to (
    :house_table,
    class_name: 'House',
    foreign_key: :house_id,
  )
end