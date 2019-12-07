local ui = {}

------------
-- Slider --
------------
ui.slider = {}

function ui.slider.init(self, node, min, max)
    -- bar
    self.bar = {
        node = gui.get_node(node .. '/slider:bar'),
    }
    self.bar.size = gui.get_size(self.bar)
    self.bar.pos = gui.get_position(self.bar)

    -- btn
    self.btn = {
        node = gui.get_node(node .. '/slider:btn'),
    }
    self.btn.size = gui.get_size(btn)
    self.btn_diam = self.btn.size.x

    -- hit area
    self.hit_area = {
        node = gui.new_box_node(gui.get_position(bar), vmath.vector3(size.x, btn_dia, size.z))
    }
    gui.set_color(area, vmath.vector4(0,0,0,0))

    if hit_test(self, area, action_id, action) then
        local btn_pos = gui.get_position(btn)
        local bar_pos = gui.get_position(bar)
        local bar_size = gui.get_size(bar)
        local dx = action.x - (bar_pos.x - (bar_size.x - btn_dia) / 2)
        local xp = round(action.x, bar_size.x / (max - min))

        value = dx / (bar_size.x - btn_dia) * (max - min) + min
        gui.set_position(btn, vmath.vector3(xp, btn_pos.y, btn_pos.z))
    end
    gui.delete_node(area)

    return round(value, 1)
end

function ui.slider.bind(self, action_id, action, value)

end

return ui
