-- input manager
-- cubee

Input = {}

Device = {
    KEYBOARD = {},
    GAMEPAD = {},
}

--TODO: proper keybindings inplementation
--TODO: gamepad bindings
Action = {
    UP = {"up"},
    DOWN = {"down"},
    LEFT = {"left"},
    RIGHT = {"right"},
    FIRE = {"z"},
    DASH = {"x"},
    CONFIRM = {"z"},
    BACK = {"x"},
    PAUSE = {"enter"},
    RESET = {"backspace"},
    SCROLL_LEFT = {"["},
    SCROLL_RIGHT = {"]"},
}

--- create an input handler
---@param device any
---@param device_id integer only used for gamepads, ignored for other devices
---@return table
function Input:new(device, device_id)
    local o = {
        device = device,
        device_id = device_id,
    }

    setmetatable(o, self)
    self.__index = self

    return o
end

--- assign input instance to control an object
---@param object any
function Input:assignTo(object)
    object.input = self
end

---comment
---@param action any Action to check if any keys are pressed for
---@return boolean
function Input:action(action)

    if self.device == Device.KEYBOARD then
        for i, key in ipairs(action) do
            if love.keyboard.isDown(key) then -- won't use keys directly here cause otherwise the extension complains
                return true
            end
        end

    elseif self.device == Device.GAMEPAD then
        --TODO: gamepad support
        
    end

    return false

end
