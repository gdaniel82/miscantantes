class Disk < ApplicationRecord
    belongs_to :singer, foreign_key: :singer_id
end
