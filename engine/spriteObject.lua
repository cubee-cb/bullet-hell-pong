-- sprite object class
-- cubee

require("engine/object")

require("engine/drawing")
require("engine/assets")

SpriteObject = Object:new()

function SpriteObject:new(o)
    o = o or {
        spriteKey = "none"
    }

    setmetatable(o, self)
    self.__index = self

    return o
end

function SpriteObject:draw()
    Drawing:drawSprite(AssetManager:getSprite(self.spriteKey), self.position)
end
