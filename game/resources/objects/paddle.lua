-- paddle object
-- cubee

require("engine/input")
require("engine/spriteObject")

Paddle = SpriteObject:new()

function Paddle:new(position, spriteKey, input)
    local o = {
        spriteKey = spriteKey,
        input = input,
        position = position,
        velocity = {
            x = 0,
            y = 0
        },
    }

    setmetatable(o, self)
    self.__index = self

    return o
end

function Paddle:update()
    self.velocity.x = 0
    self.velocity.y = 0

    if self.input:action(Action.UP) then
        self.velocity.y = -1
    end
    if self.input:action(Action.DOWN) then
        self.velocity.y = 1
    end

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


