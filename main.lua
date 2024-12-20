require("engine/object")
require("engine/window")
require("engine/compat")

function love.load()
    Compat:checkVersion()

    Window:setInternalResolution(180, 128)
    if not Window:init(800, 480) then
        print("failed to create window. uhh. that's probably not good")
    end


end


function love.update()
end


function love.draw()
    -- draw to game screen
    love.graphics.setCanvas(Window.internalCanvas)
    love.graphics.clear(0.2, 0.1, 0.3)

    

    Window:draw()
end
