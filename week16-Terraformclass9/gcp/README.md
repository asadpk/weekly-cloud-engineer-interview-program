#  CDk Installation
```
sudo apt-get install apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-cli

```

```
gcloud init
gcloud compute images list
```


```
resource "google_compute_disk" "tfer--dsk-ssd-beuxpnetmon01-boot" {
  image = "ubuntu-os-pro-cloud/ubuntu-pro-2004-lts"
  labels = {
    cost = "vm-beuxpnetmon01"
  }

  name                      = "dsk-ssd-beuxpnetmon01-boot"
  physical_block_size_bytes = "4096"
  project                   = "rapid-notch-202306"
  size                      = "20"
  type                      = "pd-standard"
  zone                      = "europe-west1-b"
}
```



- vm.tf

```
resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
 project = "rapid-notch-202306"
  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

```

