-- hellpong game main update file
-- cubee

require("engine/window")
require("engine/spriteObject")

require("game/resources/objects/ball")

Game = {}

local object
local ball

function Game:init()
    Compat:setTargetVersion("11.5")

    Window:setInternalResolution(320, 180, true) -- 16:9
    --Window:setInternalResolution(320, 200) -- 16:10

    local fullscreen = false
    if not Window:updateMode(1280, 800, fullscreen) then
        print("failed to create the game window. uhh. that's probably not good")
    end

    AssetManager:loadSprite("ball", "ball.png")
    AssetManager:loadSprite("see-the-error", "no-exist.png")

    object = SpriteObject:new({
        position = {
            x = 16,
            y = 16
        },
        spriteKey = "ball"
    })


    ball = Ball:new({
        position = {
            x = 16,
            y = 16
        },
        spriteKey = "ball"
    })
end


function Game:update(dt)

    ball:update()

    --[[
    object:move(2, 1)

    if object.position.x > Window.internal_width then
        object:move(-Window.internal_width, 0)
    end
    if object.position.y > Window.internal_height then
        object:move(0, -Window.internal_height)
    end
--]]
end


function Game:draw(canvas)
    --object:draw()

    ball:draw()

    Drawing:drawSprite(AssetManager:getSprite("ball"), {x = 0, y = 16})
    Drawing:drawSprite(AssetManager:getSprite("ball"), {x = 1, y = 32}) -- because of the overscan, we should draw with a 1px offset from the edges

    Drawing:drawSprite(AssetManager.missingTexture, {x = 0, y = 0})
end
