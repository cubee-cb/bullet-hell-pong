-- window manager
-- cubee

Window = {}

--- initialise the window
---@param window_width any
---@param window_height any
---@param fullscreen any
function Window:init(window_width, window_height, fullscreen)

    -- use display size if in fullscreen
    if fullscreen then
        window_width, window_height = love.graphics.getDimensions()
    end

    self:updateScale(window_width, window_height, false)

    return love.window.setMode(window_width, window_height, {fullscreen = fullscreen, fullscreentype = "desktop"})
end

--- set the internal resolution of the game display
---@param internal_width any
---@param internal_height any
function Window:setInternalResolution(internal_width, internal_height)
    self.internal_width, self.internal_height = internal_width, internal_height
    self.base_internal_width, self.base_internal_height = internal_width, internal_height

    self:initInternalCanvas()
end

function Window:initInternalCanvas()
    -- discard old canvas if it exists
    if self.internalCanvas then
        self.internalCanvas:release()
    end

    self.internalCanvas = love.graphics.newCanvas(self.internal_width, self.internal_height);

end

--- set the scale to fit the specified dimensions
---@param window_width any
---@param window_height any
---@param resize any whether to resize the internal screen to cover the whole window. false to letterbox.
function Window:updateScale(window_width, window_height, resize)
    self.scale = math.min(window_width / self.base_internal_width, window_height / self.base_internal_width)

    if resize then
        -- internal pixels to add, so the internal display covers the full screen instead of potentially missing the edges
        local overscan = 2

        self.internal_width = math.floor(window_width / self.scale) + overscan
        self.internal_height = math.floor(window_height / self.scale) + overscan
        
        -- re-init the internal canvas
        self:initInternalCanvas()
    end
end

--- draw the window's canvas to the screen
function Window:draw()

    -- draw internal screen to window
    love.graphics.setCanvas()
    love.graphics.clear(0, 0, 0)

    local window_width, window_height = love.window.getMode();
    local offset_x = (window_width - self.internalCanvas:getWidth() * self.scale) / 2
    local offset_y = (window_height - self.internalCanvas:getHeight() * self.scale) / 2

    love.graphics.draw(self.internalCanvas, offset_x, offset_y, 0, self.scale, self.scale)
end

