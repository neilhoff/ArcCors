# The @env pragma is synced (and overwritten) by running arc env
@env
testing
  ARC_SANDBOX_ENABLE_CORS true

# staging
  # Add staging env vars with: arc env staging NAME value

# production
  # Add production env vars with: arc env production NAME value
