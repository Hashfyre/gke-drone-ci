resource "google_container_cluster" "gke-drone" {
  name               = "gke-drone"
  zone               = "us-central1-a"
  initial_node_count = 1

  master_auth {
    username = "${var.cluster-master-user}"
    password = "${var.cluster-master-pass}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }
}

resource "google_container_node_pool" "drone-server" {
  name               = "drone-server"
  zone               = "us-central1-a"
  cluster            = "${google_container_cluster.gke-drone.name}"
  initial_node_count = 1
}

resource "google_container_node_pool" "drone-agent" {
  name               = "drone-agent"
  zone               = "us-central1-a"
  cluster            = "${google_container_cluster.gke-drone.name}"
  initial_node_count = 1
}
