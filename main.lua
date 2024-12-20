-- love2d engine
-- cubee

require("engine/compat")
require("engine/window")
require("engine/assets")

require("game/game")

function love.load()
    -- default target: love2d 11
    Compat:setTargetVersion("11.5")

    -- create initial window
    Window:setInternalResolution(128, 128, false)
    Window.marginColour = {0.1, 0.1, 0.4}
    if not Window:updateMode(640, 480, false) then
        print("failed to create window!")
    end

    -- load assets
    love.graphics.setDefaultFilter("linear", "nearest")
    AssetManager:init()

    -- game init
    Game:init()

    -- make sure we're running on the love2d version we expect
    Compat:checkVersion()
end


function love.update(dt)

    Game:update(dt)
end


function love.draw()
    -- draw to game screen
    love.graphics.setCanvas(Window.internalCanvas)
    love.graphics.clear(0.2, 0.1, 0.3)

    Game:draw()

    -- draw internal screen to window
    love.graphics.setCanvas()
    love.graphics.clear(Window.marginColour)

    Window:draw()

end
