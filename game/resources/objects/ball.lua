-- ball object
-- cubee

require("engine/spriteObject")

Ball = SpriteObject:new()

function Ball:new(o)
    o = o or {
    }

    self.velocity.x = 0.5
    self.velocity.y = 0.5

    setmetatable(o, self)
    self.__index = self

    return o
end

function Ball:update()

    self:move(self.velocity.x, self.velocity.y)


    -- simple collisions
    if self.position.y >= 180-32 then
        self.position.y = 180-32
        self.velocity.y = math.abs(self.velocity.y) * -1.05
    end
    if self.position.x >= 320-32 then
        self.position.x = 320-32
        self.velocity.x = math.abs(self.velocity.x) * -1.05
    end
    if self.position.y <= 16 then
        self.position.y = 16
        self.velocity.y = math.abs(self.velocity.y) * 1.05
    end
    if self.position.x <= 16 then
        self.position.x = 16
        self.velocity.x = math.abs(self.velocity.x) * 1.05
    end

end


