-- love2d engine
-- cubee

function love.load()
    -- default target: love2d 11
    Compat:setTargetVersion("11.5")

    Window:setInternalResolution(180, 128)
    if not Window:init(800, 480) then
        print("failed to create window. uhh. that's probably not good")
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
