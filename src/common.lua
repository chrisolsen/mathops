-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

function onTouch(action_id, action, actionMap)
    if hash('touch') == action_id and action.pressed then
        for id, fn in pairs(actionMap) do
            local item = gui.get_node(id)
            if gui.pick_node(item, action.x, action.y) then
                fn()
                return true
            end
        end
    end
    return false
end
