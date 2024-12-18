return function(targetPlayerName, amount, comma)
    if targetPlayerName == "" or tonumber(amount) == nil or tonumber(amount) <= 0 then
        warn("Invalid input. Please enter a username and a valid donation amount.")
        return
    end

    local formattedAmount = comma(amount)

    local player = game:GetService("Players").LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local uiTemplates = playerGui:FindFirstChild("UITemplates")
    if not uiTemplates then
        warn("UITemplates not found!")
        return
    end

    local donationPopup = uiTemplates:FindFirstChild("donationPopup")
    if not donationPopup then
        warn("Donation popup template not found!")
        return
    end

    local screenGui = playerGui:FindFirstChild("ScreenGui")
    if not screenGui then
        warn("ScreenGui not found!")
        return
    end

    local popups = screenGui:FindFirstChild("Popups")
    if not popups then
        warn("Popups container not found!")
        return
    end

    local popupClone = donationPopup:Clone()
    popupClone.Parent = popups
    popupClone.Visible = true

    local messageLabel = popupClone:FindFirstChild("Message")
    if messageLabel and messageLabel:IsA("TextLabel") then
        messageLabel.Text = targetPlayerName .. " DONATED " .. formattedAmount .. " TO YOU!"
    end

local sound = game:GetService("SoundService").SFX.DonationLevels.DonationLevel3

sound:Play()

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Robux Stealer", 
        Text = formattedAmount .. " from " .. targetPlayerName,
        Duration = 3
    })

    warn("Robux Stealing Simulation: " .. formattedAmount .. " from " .. targetPlayerName)

    wait(2)

    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    local tween = tweenService:Create(popupClone, tweenInfo, {BackgroundTransparency = 1})
    tween:Play()

    for _, descendant in pairs(popupClone:GetDescendants()) do
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
            local textTween = tweenService:Create(descendant, tweenInfo, {TextTransparency = 1})
            textTween:Play()
        elseif descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
            local imageTween = tweenService:Create(descendant, tweenInfo, {ImageTransparency = 1})
            imageTween:Play()
        end
    end

    tween.Completed:Wait()
    popupClone:Destroy()
end
