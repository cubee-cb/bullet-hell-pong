-- love2d version check
-- cubee

Compat = {}

function Compat:setTargetVersion(version)
    self.targetVersion = version
end

function Compat:checkVersion()
    local runner_version = love.getVersion()

    print("running on love2d " .. runner_version .. "")

    if self.targetVersion and not love.isVersionCompatible(self.targetVersion) then
        print("love2d " .. runner_version .. " is incompatible with target version " .. self.targetVersion .. ". you may encounter bugs or crashes!")
    end

end
