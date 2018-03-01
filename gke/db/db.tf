resource "google_sql_database_instance" "drone" {
  name             = "drone"
  database_version = "POSTGRES_9_6"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "drone" {
  name     = "drone"
  instance = "${google_sql_database_instance.drone.name}"
  charset  = "UTF8"
}

resource "google_sql_user" "drone" {
  name     = "drone"
  instance = "${google_sql_database_instance.drone.name}"
  password = "${var.google-sql-pass}"
  host     = "0.0.0.0/0"
}
