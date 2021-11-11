class CollectionAssignment < ApplicationRecord
    validates :collection_id, :artwork_id, presence: true
    validates :collection_id, uniqueness: {scope: [:artwork_id]}

    belongs_to :collection,
    class_name: :Collection,
    primary_key: :id,
    foreign_key: :collection_id

    belongs_to :artwork,
    class_name: :Artwork,
    primary_key: :id,
    foreign_key: :artwork_id

end