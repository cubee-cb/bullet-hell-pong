-- hellpong game main update file
-- cubee

require("engine/window")
require("engine/input")
require("engine/spriteObject")

require("game/resources/objects/ball")
require("game/resources/objects/paddle")
require("game/resources/objects/bullet")

Game = {}

local inputs = {}

local object
local balls = {}
local paddles = {}
local bullets = {}

function Game:init()
    Compat:setTargetVersion("11.5")

    -- set up game display
    Window:setInternalResolution(320, 180, true) -- 16:9
    --Window:setInternalResolution(320, 200) -- 16:10

    local fullscreen = false
    if not Window:updateMode(1280, 800, fullscreen) then
        print("failed to create the game window. uhh. that's probably not good")
    end

    -- load assets
    AssetManager:loadSprite("ball", "ball.png")
    AssetManager:loadSprite("paddle-left", "paddle-left.png")
    AssetManager:loadSprite("paddle-right", "paddle-right.png")
    AssetManager:loadSprite("see-the-error", "no-exist.png")


    -- set up input
    inputs[1] = Input:new(Device.KEYBOARD, -1)
    inputs[2] = Input:new(Device.GAMEPAD, 1)


    object = SpriteObject:new({
        position = {
            x = 16,
            y = 16
        },
        spriteKey = "ball"
    })

    balls[1] = Ball:new({x = 50, y = 50}, {x = 0.5, y = 0.5}, "ball")


    paddles[1] = Paddle:new({x = 32, y = 100}, "paddle-left", inputs[1])
    paddles[2] = Paddle:new({x = 320-32, y = 100}, "paddle-right", inputs[2])

end


function Game:update(dt)

    -- update balls
    for i, ball in ipairs(balls) do
        ball:update()
    end

    -- update paddles
    for i, paddle in ipairs(paddles) do
        paddle:update()
    end

    -- update bullets
    for i, bullet in ipairs(bullets) do
        bullet:update()
    end


    --TODO: resolve collisions

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

    -- draw balls
    for i, ball in ipairs(balls) do
        ball:draw()
    end

    -- draw paddles
    for i, paddle in ipairs(paddles) do
        paddle:draw()
    end

    -- draw bullets
    for i, bullet in ipairs(bullets) do
        bullet:draw()
    end

    --Drawing:drawSprite(AssetManager:getSprite("ball"), {x = 0, y = 16})
    --Drawing:drawSprite(AssetManager:getSprite("ball"), {x = 1, y = 32}) -- because of the overscan, we should draw with a 1px offset from the edges

    --Drawing:drawSprite(AssetManager.missingTexture, {x = 0, y = 0})
end
