class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :target ,polymorphic: true
  scope :by_user,
    ->(user_ids){where user_id: user_ids if user_ids.present?}

  scope :orderd, ->{order created_at: :desc}
end
