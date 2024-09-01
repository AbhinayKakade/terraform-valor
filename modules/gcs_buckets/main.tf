locals {
  standard_buckets = { for bucket in var.buckets : bucket.name => merge(bucket, { storage_class = "STANDARD" }) if bucket.storage_class == "STANDARD" }
  archive_buckets  = { for bucket in var.buckets : bucket.name => merge(bucket, { storage_class = "ARCHIVE" }) if bucket.storage_class == "ARCHIVE" }
  all_buckets      = merge(local.standard_buckets, local.archive_buckets)
}

resource "google_storage_bucket" "buckets" {
  for_each                    = local.all_buckets
  name                        = each.value.name
  location                    = each.value.location
  storage_class               = each.value.storage_class
  uniform_bucket_level_access = true
  versioning {
    enabled = lookup(each.value, "versioning", false)
  }
  project = var.project

  dynamic "lifecycle_rule" {
    for_each = coalesce(lookup(each.value, "lifecycle_rules", []), []) # Ensure it's never null
    content {
      action {
        type = lifecycle_rule.value.action_type
      }
      condition {
        age                   = lookup(lifecycle_rule.value, "age", null)
        created_before        = lookup(lifecycle_rule.value, "created_before", null)
        with_state            = lookup(lifecycle_rule.value, "with_state", null)
        matches_storage_class = lookup(lifecycle_rule.value, "matches_storage_class", null)
        num_newer_versions    = lookup(lifecycle_rule.value, "num_newer_versions", null)
      }
    }
  }

  dynamic "logging" {
    for_each = coalesce(lookup(each.value, "logging", []), []) # Ensure it's never null
    content {
      log_bucket        = logging.value.log_bucket
      log_object_prefix = logging.value.log_object_prefix
    }
  }

  dynamic "cors" {
    for_each = coalesce(lookup(each.value, "cors", []), []) # Ensure it's never null
    content {
      max_age_seconds = lookup(cors.value, "max_age_seconds", null)
      method          = cors.value.method
      origin          = cors.value.origin
      response_header = lookup(cors.value, "response_header", null)
    }
  }
}