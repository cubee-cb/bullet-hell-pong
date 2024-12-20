-- love2d version check
-- cubee

Compat = {}

function Compat:setTargetVersion(version)
    self.targetVersion = version
end

function Compat:checkVersion()
    local major, minor, revision, codename = love.getVersion()
    local runner_version_string = major .. "." .. minor .. "." .. revision .. " (" .. codename .. ")"
    
    self.runningCompatibleVersion = true

    print("running on love2d " .. runner_version_string)

    if self.targetVersion and not love.isVersionCompatible(self.targetVersion) then
        print("love2d " .. runner_version_string .. " is incompatible with target version " .. self.targetVersion .. ". you may encounter bugs or crashes!")
        self.runningCompatibleVersion = false
    end

    return self.runningCompatibleVersion
end
