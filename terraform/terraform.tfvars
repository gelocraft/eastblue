droplet_name     = "eastblue"
droplet_image    = "ubuntu-24-04-x64"
droplet_snapshot = data.digitalocean_droplet_snapshot.eastblue.id
droplet_region   = "sgp1"
droplet_ssh_keys = ["51:83:6f:ee:e7:74:39:75:77:1f:f2:12:7a:89:4b:5b"]
