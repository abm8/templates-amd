## ----------------------------------------------------------------------------
## EdgeGrid Variables
## ----------------------------------------------------------------------------
edgerc_path    = "~/.edgerc"
edgerc_section = "default"

## ----------------------------------------------------------------------------
## Scope
## ----------------------------------------------------------------------------
contract_id = "ctr_contactID"
group_id    = "grp_groupID"

## ----------------------------------------------------------------------------
## Configuration settings | Property
## ----------------------------------------------------------------------------
product_id = "prd_Adaptive_Media_Delivery"
name       = "<Config Name>"

hostnames = [
  {
    cname_from             = "qa-media.example.com"
    cname_to               = "qa-media.example.com.akamaized.net"
    cert_provisioning_type = "CPS_MANAGED"
  }
]

etls                = true
default_origin      = "qa-origin.example.com"
forward_host_header = "REQUEST_HOST_HEADER"
http2_enabled       = true
min_tls_version     = "DYNAMIC"
verification_mode   = "PLATFORM_SETTINGS"

cpcode_name = "cpcode_name_qa"

## ----------------------------------------------------------------------------
## AMD behaviors
## ----------------------------------------------------------------------------
segmented_media_optimization_behavior = "ON_DEMAND"
origin_authentication_method          = "AUTOMATIC"
origin_country                        = "UNKNOWN"
client_country                        = "UNKNOWN"

content_catalog_size            = "UNKNOWN"
content_type                    = "HD"
content_popularity_distribution = "UNKNOWN"
enable_dash                     = true
enable_hds                      = true
enable_hls                      = true
enable_smooth                   = true
segment_duration_dash           = "SEGMENT_DURATION_6S"
segment_duration_hds            = "SEGMENT_DURATION_6S"
segment_duration_hls            = "SEGMENT_DURATION_10S"
segment_duration_smooth         = "SEGMENT_DURATION_2S"

cache_key_query_params_behavior        = "IGNORE_ALL"
enable_dynamic_throughput_optimization = true
enable_http3                           = true

# Set to true and provide dash_media_encryption/hls_media_encryption if this
# property requires token auth / media encryption.
enable_segmented_content_protection = false
dash_media_encryption               = false
hls_media_encryption                = false

# Leave enable_debug = false unless actively troubleshooting. debug_key is
# sensitive -- set it via TF_VAR_debug_key or a secrets-managed file, not here.
enable_debug = false
# debug_key  = null

enable_cors_policy     = true
cors_allow_origin      = "*"
cors_allow_methods     = "GET,POST,OPTIONS"
cors_allow_headers     = "origin,range,hdntl,hdnts,CMCD-Request,CMCD-Object,CMCD-Status,CMCD-Session"
cors_expose_headers    = "Server,range,hdntl,hdnts,Akamai-Mon-Iucid-Ing,Akamai-Mon-Iucid-Del,Akamai-Request-BC"
cors_allow_credentials = "true"
cors_max_age           = "86400"

## ----------------------------------------------------------------------------
## Activation
## ----------------------------------------------------------------------------
activation_contacts    = ["emails for notifications"]
activate_to_staging    = false
activate_to_production = false

# Only required when activate_to_production = true. See main.tf docstring /
# module README for the noncompliance_reason -> required-fields mapping.
noncompliance_reason       = []
ticket_id                  = null
other_noncompliance_reason = null
peer_reviewed_by           = null
customer_email             = null
unit_tested                = null

activation_notes = "Activated via Terraform"
