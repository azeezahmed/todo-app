class Todo < ApplicationRecord

validates :title, presence:true

enum status: [:pending,:completed]
end

