require("engine/object")
require("engine/window")
require("engine/compat")

function love.load()
    Compat:checkVersion()

    Window:setInternalResolution(640, 480)
    if not Window:init(800, 480) then
        print("failed to create window. uhh. that's probably not good")
    end


end


function love.update()
end


function love.draw()

    Window:draw()
end
