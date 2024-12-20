-- window manager
-- cubee

Window = {
    marginColour = {0.1, 0.1, 0.4},
    overscan = false
}

--- initialise the window
---@param window_width integer window width in windowed mode
---@param window_height integer window height in windowed mode
---@param fullscreen boolean whether to set the window to fullscreen mode, using the desktop resolution
function Window:updateMode(window_width, window_height, fullscreen)

    self.scale = math.floor(math.min(window_width / self.base_internal_width, window_height / self.base_internal_height))

    if self.allow_expanding then
        -- internal pixels to add, so the internal display covers the full screen instead of potentially missing the edges
        local overscan_px = 2

        self.internal_width = math.floor(window_width / self.scale)
        self.internal_height = math.floor(window_height / self.scale)

        -- only add overscan if it's actually needed, i.e. any size that leaves a fractional internal pixel at the edges
        if self.overscan and self.internal_width * self.scale < window_width then 
            self.internal_width = self.internal_width + overscan_px
        end
        if self.overscan and self.internal_height * self.scale < window_height then 
            self.internal_height = self.internal_height + overscan_px
        end
        
        -- re-init the internal canvas
        self:initInternalCanvas()
    end


    return fullscreen
        and love.window.setMode(0, 0, {fullscreen = true, fullscreentype = "desktop"})
        or love.window.setMode(window_width, window_height, {fullscreen = false})
end

--- set the internal resolution of the game display
---@param internal_width integer base width of the internal display
---@param internal_height integer base height of the internal display
---@param allow_expanding boolean when true, allow the scaler to change the internal resolution to fill the screen
function Window:setInternalResolution(internal_width, internal_height, allow_expanding)
    self.internal_width, self.internal_height = internal_width, internal_height
    self.base_internal_width, self.base_internal_height = internal_width, internal_height

    self.allow_expanding = allow_expanding

    self:initInternalCanvas()
end

--- initialise the internal canvas sent to the game
function Window:initInternalCanvas()
    -- discard old canvas if it exists
    if self.internalCanvas then
        self.internalCanvas:release()
    end

    self.internalCanvas = love.graphics.newCanvas(self.internal_width, self.internal_height);

end

--- draw the window's canvas to the screen
function Window:draw()

    local window_width, window_height = love.window.getMode();
    local offset_x = (window_width - self.internalCanvas:getWidth() * self.scale) / 2
    local offset_y = (window_height - self.internalCanvas:getHeight() * self.scale) / 2

    love.graphics.draw(self.internalCanvas, offset_x, offset_y, 0, self.scale, self.scale)
end

