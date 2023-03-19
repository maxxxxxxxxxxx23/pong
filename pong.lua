function love.load()
    -- Initialize window and variables
    love.window.setMode(640, 480)
    ball = {x = 320, y = 240, vx = 150, vy = -50, size = 10}
    paddle1 = {y = 200, size = 50}
    paddle2 = {y = 200, size = 50}
    score1 = 0
    score2 = 0
end

function love.update(dt)
    -- Update ball position and check for collision with walls
    ball.x = ball.x + ball.vx * dt
    ball.y = ball.y + ball.vy * dt
    if ball.y < 0 or ball.y > 480 - ball.size then
        ball.vy = -ball.vy
    end
    
    -- Check for collision with paddles
    if ball.x < 20 and ball.y > paddle1.y and ball.y < paddle1.y + paddle1.size then
        ball.vx = -ball.vx
    end
    if ball.x > 620 and ball.y > paddle2.y and ball.y < paddle2.y + paddle2.size then
        ball.vx = -ball.vx
    end
    
    -- Update paddle positions
    if love.keyboard.isDown("w") and paddle1.y > 0 then
        paddle1.y = paddle1.y - 200 * dt
    end
    if love.keyboard.isDown("s") and paddle1.y < 480 - paddle1.size then
        paddle1.y = paddle1.y + 200 * dt
    end
    if love.keyboard.isDown("up") and paddle2.y > 0 then
        paddle2.y = paddle2.y - 200 * dt
    end
    if love.keyboard.isDown("down") and paddle2.y < 480 - paddle2.size then
        paddle2.y = paddle2.y + 200 * dt
    end
    
    -- Check for ball going out of bounds and update score
    if ball.x < 0 then
        score2 = score2 + 1
        ball.x = 320
        ball.y = 240
        ball.vx = -ball.vx
    end
    if ball.x > 640 then
        score1 = score1 + 1
        ball.x = 320
        ball.y = 240
        ball.vx = -ball.vx
    end
end

function love.draw()
    -- Draw paddles and ball
    love.graphics.rectangle("fill", 10, paddle1.y, 10, paddle1.size)
    love.graphics.rectangle("fill", 620, paddle2.y, 10, paddle2.size)
    love.graphics.circle("fill", ball.x, ball.y, ball.size)
    
    -- Draw scores
    love.graphics.print(score1, 200, 10)
    love.graphics.print(score2, 440, 10)
end
