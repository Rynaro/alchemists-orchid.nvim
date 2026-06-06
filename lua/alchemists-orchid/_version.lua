-- Version information following Semantic Versioning (SemVer)
-- Format: MAJOR.MINOR.PATCH[-PRERELEASE][+BUILD]

return {
  major = 3,
  minor = 0,
  patch = 0,
  prerelease = nil,  -- e.g., "alpha.1", "beta.2", "rc.1"
  build = nil,       -- e.g., "20240101", "abc123"
  
  -- Convenience function to get version string
  string = function(self)
    local version = string.format("%d.%d.%d", self.major, self.minor, self.patch)
    if self.prerelease then
      version = version .. "-" .. self.prerelease
    end
    if self.build then
      version = version .. "+" .. self.build
    end
    return version
  end,
}
