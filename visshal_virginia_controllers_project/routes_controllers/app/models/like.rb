class Like < ApplicationRecord
    validates :user_id, uniqueness: {scope: [:likeable_id, :likeable_type]}

    belongs_to :user,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

    belongs_to :likeable,
    polymorphic: :true
end