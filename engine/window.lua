-- window manager
-- cubee

Window = {}

--- set the internal resolution of the game display
---@param internal_width any
---@param internal_height any
function Window:setInternalResolution(internal_width, internal_height)
    self.internal_width = internal_width
    self.internal_height = internal_height

    -- discard old canvas if it exists
    if self.canvas then
        self.canvas:release()
    end

    self.canvas = love.graphics.newCanvas(self.internal_width, self.internal_height);

end

--- initialise the window
---@param window_width any
---@param window_height any
---@param fullscreen any
function Window:init(window_width, window_height, fullscreen)

    -- use display size if in fullscreen
    if fullscreen then
        window_width, window_height = love.graphics.getDimensions()
    end

    self:updateScale(window_width, window_height)

    return love.window.setMode(window_width, window_height, {fullscreen = fullscreen, fullscreentype = "desktop"})
end

--- set the scale to fit the specified dimensions
---@param window_width any
---@param window_height any
function Window:updateScale(window_width, window_height)
    self.scale = math.min(window_width / self.internal_width, window_height / self.internal_height)

end

--- draw the window's canvas to the screen
function Window:draw()
    love.graphics.draw(self.canvas, 0, 0)
end