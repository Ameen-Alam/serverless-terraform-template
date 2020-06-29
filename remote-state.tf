terraform{
    backend "remote"{
        organization = "panacloud-org"
        workspaces {
            name = "skills-devops"
        }
    }
}