terraform {
  required_providers {
    kubiya = {
      source = "kubiya-terraform/kubiya"
    }
  }
}

provider "kubiya" {
  // Your Kubiya API Key will be taken from the
  // environment variable KUBIYA_API_KEY
  // To set the key, please use export KUBIYA_API_KEY="YOUR_API_KEY"
}

resource "kubiya_agent" "agent" {
  // Mandatory Fields
  name         = "Kubernetes" // String
  runner       = "bht-kubiya-cluster"     // String
  description  = <<EOT
This agent is capable of managing Kubernetes with kubectl.
EOT
  instructions = <<EOT
You are an intelligent agent designed to help with all Kubernetes tasks.
EOT
  // Optional fields, String
  model = "azure/gpt-4o" // If not provided, Defaults to "azure/gpt-4"
  // If not provided, Defaults to "ghcr.io/kubiyabot/kubiya-agent:stable"
  image = "kubiya/base-agent:tools-v4"

  // Optional Fields:
  // Arrays
  secrets      = []
  integrations = ["slack"]
  users        = []
  groups       = ["Admin", "Users"]
  links = []
  environment_variables = {
    DEBUG            = "1"
    LOG_LEVEL        = "INFO"
  }
}