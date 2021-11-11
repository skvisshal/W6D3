class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :image_url, uniqueness: true
    validates :artist_id, uniqueness: {scope: :title}

    belongs_to :artist,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :artist_id

    has_many :artwork_shares,
    class_name: 'ArtworkShare',
    primary_key: :id,
    foreign_key: :artwork_id

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

    def self.artworks_from_user(user_id)
        Artwork.distinct.left_outer_joins(:artwork_shares)
            .where('artworks.artist_id = ? OR artwork_shares.viewer_id = ?', user_id, user_id)
    end
end