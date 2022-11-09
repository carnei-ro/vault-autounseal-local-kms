disable_mlock = true
ui = true

listener "tcp" {
  tls_disable     = 1
  address         = "0.0.0.0:8200"
  cluster_address = "0.0.0.0:8201"
}

seal "awskms" {
  region     = "us-east-1"
  access_key = "foo"
  secret_key = "bar"
  kms_key_id = "c214a70a-6055-11ed-89e5-b3dfbf565a15"
  endpoint   = "http://kms:8080"
}

telemetry {
  prometheus_retention_time = "2h",
  disable_hostname          = true
}

storage "raft" {
  path = "/vault/data"
  retry_join {
    leader_api_addr = "http://vault:8200"
  }
}

autopilot {
  cleanup_dead_servers           = "true"
  last_contact_threshold         = "200ms"
  last_contact_failure_threshold = "10m"
  max_trailing_logs              = 250
  min_quorum                     = 3
  server_stabilization_time      = "10s"
}

api_addr = "http://0.0.0.0:8200"
cluster_addr = "https://vault:8201"