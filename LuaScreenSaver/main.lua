-- Load the Lua symbol image
function love.load()
    lua_symbol = love.graphics.newImage("lua_symbol.png")
    
    -- Set the initial window size
    setWindowSize(1920, 1080)
    
    -- Initialize variables
    x = 960  -- Half of 1920
    y = 540  -- Half of 1080
    speed_x = 300
    speed_y = 200
    symbol_width = 100
    symbol_height = 100
end

function love.update(dt)
    -- Move the symbol
    x = x + speed_x * dt
    y = y + speed_y * dt
    
    -- Bounce the symbol off the edges of the screen
    if x < 0 then
        x = 0
        speed_x = -speed_x
    elseif x + symbol_width > love.graphics.getWidth() then
        x = love.graphics.getWidth() - symbol_width
        speed_x = -speed_x
    end
    
    if y < 0 then
        y = 0
        speed_y = -speed_y
    elseif y + symbol_height > love.graphics.getHeight() then
        y = love.graphics.getHeight() - symbol_height
        speed_y = -speed_y
    end
end

function love.draw()
    -- Draw the Lua symbol
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(lua_symbol, x, y)
end

function love.conf()
    love.graphics.setCaption("MicroScreensaver")
end

function love.keypressed(key)
    -- Toggle fullscreen mode when F11 is pressed
    if key == "f11" then
        if love.window.hasFocus() then
            minimizeWindow()
        end
    end
end

function minimizeWindow()
    if love.system.getOS() == "Windows" then
        love.window.minimize()
    end
end

function setWindowSize(width, height)
    love.window.setMode(width, height, {resizable = true})
end
