terraform {
  backend "remote" {
    organization = "org-asm"
    workspaces {
      name = "geloman-cloud"
    }
  }
}
