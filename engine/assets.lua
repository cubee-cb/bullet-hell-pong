-- asset manager
-- cubee

AssetManager = {
    resourcePath = "game/resources/",
    sprites = {},
    sounds = {},
    music = {},
    fonts = {},
    objectScripts = {},
}

function AssetManager:init()
    -- create missing texture
    self.missingTexture = love.graphics.newCanvas(16, 16)
    love.graphics.setCanvas(self.missingTexture)
    love.graphics.clear(0, 0, 0)

    love.graphics.setColor(1, 0, 0.8)
    love.graphics.rectangle("fill", 0, 0, 8, 8)
    love.graphics.rectangle("fill", 8, 8, 8, 8)


    -- reset canvas
    love.graphics.setColor(1, 1, 1)
    love.graphics.setCanvas()

end

function AssetManager:loadSprite(spriteKey, path)
    path = self.resourcePath .. "sprites/" .. path

    if love.filesystem.getInfo(path) then
        self.sprites[spriteKey] = love.graphics.newImage(path)
        print("loaded \"" .. path .. "\" as \"" .. spriteKey .. "\"")

        return true
    end

    print("couldn't find sprite at \"" .. path .. "\", using missing sprite")
    self.sprites[spriteKey] = self.missingTexture
    return false
end

function AssetManager:getSprite(spriteKey)
    local sprite = self.sprites[spriteKey]
    if not sprite then
        sprite = self.missingTexture
        self.sprites[spriteKey] = self.missingTexture

        print("sprite \"" .. spriteKey .. "\" was not loaded, using missing sprite")
    end

    return sprite
end

