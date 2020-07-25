function setRoute(routeParams)
    msg.post(ROOT_ID, 'action', { action = routeParams })
end

function handleRouteChange()
    if message.action == 'landing:load' then
        load_proxy('#landing_proxy')

    elseif message.action == 'options:load' then
        load_proxy('#game_options')

    elseif message.action == 'game:load' then
        ---- don't save the state here, create a global table to hold it
        --self.game_settings = message.data
        load_proxy('#game_proxy')
    else
        print('Invalid: state => '..self.state..' action => '..message.action)
    end
end