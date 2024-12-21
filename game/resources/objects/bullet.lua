-- ball object
-- cubee

require("engine/spriteObject")

Bullet = SpriteObject:new()

function Bullet:new(position, velocity, spriteKey)
    local o = {
        spriteKey = spriteKey,
        position = position,
        velocity = velocity,
    }

    setmetatable(o, self)
    self.__index = self

    return o
end

function Bullet:update()

    self:move(self.velocity.x, self.velocity.y)


    -- simple collisions
    if self.position.y >= 180-32 then
        self:destroy()
    end
    if self.position.x >= 320-32 then
        self:destroy()
    end
    if self.position.y <= 16 then
        self:destroy()
    end
    if self.position.x <= 16 then
        self:destroy()
    end

end


