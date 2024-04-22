-- Load the Lua symbol image (You can change it to whatever you like. I recommend 200 pixels wide and 200 pixels height, but it's up to you.)
function love.load()
    lua_symbol = love.graphics.newImage("lua_symbol.png")
    
    -- Set the initial window size
    setWindowSize(1920, 1080)
    
    x = 960  -- Half of 1920 ;))
    y = 540  -- Half of 1080 ;))))

    -- The speed is variable, you can configure it as you like
    speed_x = 300
    speed_y = 200
    symbol_width = 100
    symbol_height = 100
end

function love.update(dt)
    -- 
    x = x + speed_x * dt
    y = y + speed_y * dt
    
    -- Bounces the symbol off the edges of the screen
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
    -- Draw the image you loaded (a.k.a, the default lua symbol)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(lua_symbol, x, y)
end

function love.conf()
    love.graphics.setCaption("MicroScreensaver")
end

function love.keypressed(key)
    -- Toggle/minimize the window everytime F11 is pressed
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

--Any improvements are welcome, create a pull request and let me know of any inefficient methods, i'm still learning lua :))
--Quick project this time, see ya on the next one

--Microwavedd ;))
