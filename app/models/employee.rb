class Employee < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id", dependent: :destroy
end
