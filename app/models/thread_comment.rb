class ThreadComment < ApplicationRecord
  belongs_to :user
  belongs_to :threader
end
