-- hellpong game main update file
-- cubee

require("engine/window")

Game = {}

function Game:init()
    Compat:setTargetVersion("11.5")

    Window:setInternalResolution(320, 180) -- 16:9
    --Window:setInternalResolution(320, 200) -- 16:10

    local fullscreen = false
    if not Window:init(1280, 800, fullscreen) then
        print("failed to create the game window. uhh. that's probably not good")
    end

    print(Window.scale)


end


function Game:update()
end


function Game:draw(canvas)
end
