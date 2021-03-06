---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Chris.
--- DateTime: 2020-07-25 8:17 p.m.
---

-- handle proxy loading (routing)
-- handle state changes
local Stage = {
    current = nil,
}
local State = {
    values = {},
}

local function open(self, scene_id)
    scene_id = self.root .. '#' .. scene_id
    if self.current ~= nil then
        msg.post(self.current, 'unload')
    end
    msg.post(scene_id, 'load')
    self.current = scene_id
end

-- Scenes
function Stage:init(root, scenes)
    self.root = root
    self.scenes = scenes
end

function Stage:bind(message_id, message, sender)
    -- handle initial loading
    if message_id == hash('proxy_loaded') then
        msg.post(sender, 'init')
        msg.post(sender, 'enable')
        return
    end

    -- handle scene loading
    if message_id == hash('change') then
        for _, scene_id in pairs(self.scenes) do
            if message.dest == scene_id then
                open(self, scene_id)
                return
            end
        end
    end
end

-- State

function State.setValues(values)
    State.values = values
end

function State.getValues()
    return State.values
end

function State.setValue(name, value)
    State.value[name] = value
end

function State.getValue(name)
    return State.values[name]
end

return {
    Stage = Stage,
    State = State,
}