## ----------------------------------------------------------------------------
## EdgeGrid Variables
## ----------------------------------------------------------------------------
edgerc_path    = "~/.edgerc"
edgerc_section = "ps-account"

## ----------------------------------------------------------------------------
## Scope
## ----------------------------------------------------------------------------
contract_id = "ctr_1-1NC95D"
group_id    = "grp_234677"

## ----------------------------------------------------------------------------
## Configuration settings | Property
## ----------------------------------------------------------------------------
product_id    = "prd_Adaptive_Media_Delivery"
name          = "amd-template-test"
version_notes = "AMD shared certificate test"

# Hostname mode and security profile
# ----------------------------------
# edge_hostname_type controls the Akamai edge-hostname family. The etls value
# must match the selected family as follows:
#
#   SBD + etls=true   -> Secure By Default, edgekey.net, Enhanced TLS profile
#   SBD + etls=false  -> Secure By Default, edgesuite.net, Standard TLS profile
#   EDGESUITE         -> edgesuite.net, Standard TLS profile, etls=false
#   EDGEKEY           -> edgekey.net, Enhanced TLS profile, etls=true
#   AKAMAIZED_HOSTNAME -> akamaized.net, Shared Cert profile, etls=true
#
# For AKAMAIZED_HOSTNAME, hostnames must be labels only. Do not add the
# .akamaized.net suffix; Terraform appends it to cname_from and cname_to.
etls      = true
hostnames = ["amd-template-test", "amd-template-test2"]

edge_hostname_type = "AKAMAIZED_HOSTNAME"
# certificate_id is required only for EDGEKEY and must be a CPS enrollment ID.
certificate_id = null
# Valid values: IPV4, IPV6_COMPLIANCE (dualstack), IPV6_PERFORMANCE (only IPv6)
ip_behavior = "IPV6_COMPLIANCE"

default_origin      = "abm-test-origin.com"
forward_host_header = "REQUEST_HOST_HEADER"

# Optional additional origins. Each entry needs an origin hostname, a forward
# host-header mode, and at least one hostname_match or path_match criterion.
# Supported forward_host_header values are REQUEST_HOST_HEADER,
# ORIGIN_HOSTNAME, or a custom hostname. Leave this map empty when the default
# origin should handle all requests.
additional_origins = {
  api = {
    origin_name         = "api-origin.example.com"
    forward_host_header = "abc.zxc"
    hostname_match      = ["amd-template-test2"]
    path_match          = ["/api/*"]
  }
}
http2_enabled     = true
min_tls_version   = "DYNAMIC"
verification_mode = "PLATFORM_SETTINGS"

cpcode_name = "amd-template-test1"

## ----------------------------------------------------------------------------
## AMD behaviors
## ----------------------------------------------------------------------------
# Media optimization mode. Use LIVE for live streams. Use ON_DEMAND for VOD;
segmented_media_optimization_behavior = "LIVE"
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

# Set the master switch to true only when media protection is required. The
# DASH/HLS encryption flags are effective only when this switch is true.
enable_segmented_content_protection = false
dash_media_encryption               = false
hls_media_encryption                = false

# Enhanced debug is enabled for all AMD configurations. Leave debug_key null to
# generate a stable key automatically, or provide a 64-character hexadecimal
# key through a secrets-managed tfvars file or TF_VAR_debug_key.
enable_debug = true
debug_key    = null

# CORS is enabled for media playback by default. Set enable_cors_policy=false
# to omit the CORS child rule; the remaining CORS values are then ignored.
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
# Keep both activation flags false while developing or reviewing a property.
# Set activate_to_staging=true to activate the latest version on staging.
# Set activate_to_production=true only after staging validation; production
# activation also requires the compliance fields below.
activation_contacts    = ["abm@akamai.com"]
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
