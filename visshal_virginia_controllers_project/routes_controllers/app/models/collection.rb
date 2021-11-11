class Collection < ApplicationRecord
    validates :user_id, :label, presence: true

    belongs_to :owner,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

    has_many :collection_assignments,
    class_name: :CollectionAssignment,
    primary_key: :id,
    foreign_key: :collection_id

    has_many :artworks,
    through: :collection_assignments,
    source: :artwork
end