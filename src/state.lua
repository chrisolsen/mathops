local gameState = {}

function gameState.getRoute()
    return gameState.route
end

function gameState.setRoute(route)
    gameState.route = route
end

function gameState.setValues(values)
    gameState.values = values
end

function gameState.getValues()
    return gameState.values
end

function gameState.setValue(name, value)
    gameState.value[name] = value
end

function gameState.getValue(name)
    return gameState.values[name]
end

return gameState
