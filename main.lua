-- love2d engine
-- cubee

require("engine/compat")
require("engine/window")
require("game/game")

function love.load()
    -- default target: love2d 11
    Compat:setTargetVersion("11.5")

    -- create initial window
    Window:setInternalResolution(128, 128)
    if not Window:init(640, 480, false) then
        print("failed to create window!")
    end

    -- game init
    Game:init()

    -- make sure we're running on the love2d version we expect
    Compat:checkVersion()
end


function love.update()

    Game:update()
end


function love.draw()
    -- draw to game screen
    love.graphics.setCanvas(Window.internalCanvas)
    love.graphics.clear(0.2, 0.1, 0.3)

    Game:draw(Window.internalCanvas)

    Window:draw()
end
