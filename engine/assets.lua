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
    local missingPath = "engine/resources/_missing.png"
    if love.filesystem.getInfo(missingPath) then
        self.missingTexture = love.graphics.newImage(missingPath)
    else
        print("something happened to the missing texture. it's gone missing! oh, how could the missing texture possibly go missing? this is another level of silly! anyway broken things might be invisible now so be warned.")
        self.missingTexture = love.graphics.newCanvas(16, 16)
    end

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

