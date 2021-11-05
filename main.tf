terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}
provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_track" "IveGotaWoman" {
  url = "https://open.spotify.com/track/2xar08Fq5xra2KKZs5Bw9j?si=a560a4d67eb742d0"
}
data "spotify_track" "HallelujahILoveHerSo" {
  url = "https://open.spotify.com/track/5P11rW6aJErF37MTfRZS31?si=8d58c0317cab406b"
}
data "spotify_track" "Ederlezi" {
  url = "https://open.spotify.com/track/6J3FOMuB6XYlAxaZxH4sdT?si=b814d7003d584b68"
}

resource "spotify_playlist" "playlist" {
  name        = "My playlist Terraform"
  description = "My playlist is so awesome"
  public      = false

  tracks = [
    data.spotify_track.IveGotaWoman.id,
    data.spotify_track.HallelujahILoveHerSo.id,
    data.spotify_track.Ederlezi.id,
  ]
}

/* data "spotify_search_track" "by_artist" {
  artist = "Dolly Parton"
  album = "Jolene"  
 # name  = "Early Morning Breeze"
} */
/* resource "spotify_search_track" "playlist" {
  name        = "Playlist automatized by Terraform"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
  ]
} */