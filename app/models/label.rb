class Label < ApplicationRecord
  belongs_to :tasks, optional: true
end
