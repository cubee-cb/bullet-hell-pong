-- input manager
-- cubee

Input = {}

Device = {
    KEYBOARD = {},
    GAMEPAD = {},
}

--TODO: proper bindings inplementation
Action = {
    UP = {{"up"}, { "dpup"}},
    DOWN = {{"down"}, {"dpdown"}},
    LEFT = {{"left"}, {"dpleft"}},
    RIGHT = {{"right"}, {"dpright"}},
    FIRE = {{"z"}, {"a"}},
    DASH = {{"x"}, {"b"}},
    CONFIRM = {{"z"}, {"a"}},
    BACK = {{"x"}, {"b"}},
    PAUSE = {{"enter"}, {"start"}},
    RESET = {{"backspace"}, {"x"}},
    SCROLL_LEFT = {{"["}, {"leftshoulder"}},
    SCROLL_RIGHT = {{"]"}, {"rightshoulder"}},
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
        for i, key in ipairs(action[1]) do
            if love.keyboard.isDown(key) then -- won't use keys directly here cause otherwise the extension complains
                return true
            end
        end

    elseif self.device == Device.GAMEPAD then
        --TODO: gamepad support
        local joystick = love.joystick.getJoysticks()[self.device_id]
        if not (joystick and joystick:isGamepad()) then return false end

        for i, button in ipairs(action[2]) do
            if joystick:isGamepadDown(button) then -- won't use keys directly here cause otherwise the extension complains
                return true
            end
        end
        
    end

    return false

end
