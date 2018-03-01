provider "google" {
  credentials = "${file("google-credential.json")}"
  project     = "${var.google-project["id"]}"
  region      = "${var.google-project["region"]}"
}

variable "google-project" {
  default {
    id     = "tidal-cipher-196705"
    region = "us-central1"
  }
}
