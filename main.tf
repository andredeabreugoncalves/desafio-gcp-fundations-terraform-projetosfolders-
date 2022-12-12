provider "google" {
  project = "andreag-devops-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_folder" "estatisticas" {
  display_name = "estatisticas"
  parent       = "organizations/527043576009"
}

resource "google_folder" "dashboard" {
  display_name = "dashboard"
  parent       = google_folder.estatisticas.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.dashboard.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.dashboard.name
}


resource "google_project" "andre-ag-dashboard-desenv" {
  name       = "dashboard-desenv"
  project_id = "andre-ag-dashboard-desenv"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "0182FF-A624B0-34DBDF"

}

 #resource "google_project" "andre-ag-dashboard-producao" {
 #  name       = "dashboard-Prod"
 #  project_id = "andre-ag-dashboard-producao"
 #  folder_id  = google_folder.Producao.name
 #  auto_create_network=false
 #  billing_account = "0182FF-A624B0-34DBDF"
 #}