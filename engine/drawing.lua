-- drawing routines
-- cubee

Drawing = {
    camera = {
        x = 0,
        y = 0
    }
}

--- set the camera position, this is subtracted from the position things are drawn at
---@param position table table of x and y value
function Drawing:setCamera(position)
    self.camera.position = position
end

--- draw a sprite at a position with certain transforms
---@param texture love.Drawable the sprite to draw
---@param position table table of x and y value
function Drawing:drawSprite(texture, position)
    love.graphics.draw(texture, position.x - self.camera.x, position.y - self.camera.y)
end

