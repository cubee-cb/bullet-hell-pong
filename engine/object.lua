-- object class
-- cubee

Object = {}


function Object:new(o)
    o = o or {
        position = {
            x = 0,
            y = 0
        }
    }
    setmetatable(o, self)
    self.__index = self

    return o
end

function Object:move(dx, dy)
    self.position.x = self.position.x + dx
    self.position.y = self.position.y + dy
end

function Object:update()
    
end

