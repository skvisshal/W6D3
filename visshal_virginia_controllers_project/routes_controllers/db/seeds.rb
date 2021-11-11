# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all

users = User.create([
    {username: 'vish'},
    {username: 'virg'},
    {username: 'david'},
    {username: 'tahj'},
    {username: 'kin_ka'}
])

artworks = Artwork.create([
    {title: 'Mona Lisa', image_url: 'ml.com', artist_id: 1},
    {title: 'Bold and Brash', image_url: 'bb.com', artist_id: 2},
    {title: 'The Last Supper', image_url: 'LS.com', artist_id: 3}
])

artwork_shares = ArtworkShare.create([
    {artwork_id: 1, viewer_id: 4},
    {artwork_id: 1, viewer_id: 3},
    {artwork_id: 2, viewer_id: 1},
    {artwork_id: 2, viewer_id: 2},
    {artwork_id: 3, viewer_id: 5}
])

comments = Comment.create([
    {body: 'abc', user_id: 1, artwork_id: 3},
    {body: 'so amazing!', user_id: 2, artwork_id: 1},
    {body: 'i dont like it', user_id: 5, artwork_id: 3}
])