-- Credits: @wum_pj | Narukisora Hub

game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Modifier Credits", 
        Text = "Made By @Wutahel"
        Duration = 3
    })

local function fetch(parent, childName)
    return parent and parent:FindFirstChild(childName)
end

local function change()
    local path = game:GetService("CoreGui"):FindFirstChild("PurchasePrompt")
    if not path then return end

    local container = fetch(path, "ProductPurchaseContainer")
    if not container then return end

    local animator = fetch(container, "Animator")
    local prompt = fetch(animator, "Prompt")
    local alertContents = fetch(prompt, "AlertContents")

    if alertContents then
        local titleContainer = fetch(alertContents, "TitleContainer")
        local titleArea = fetch(titleContainer, "TitleArea")
        local title = fetch(titleArea, "Title")
        if title and title:IsA("TextLabel") then
            title.Text = Title
            title.Size = UDim2.new(0, 200, 0, 20)
            title.TextScaled = true
        end

        local footer = fetch(alertContents, "Footer")
        local buttons = fetch(footer, "Buttons")
        if buttons then
            local button = buttons:FindFirstChild("2")
            if button and button:IsA("ImageButton") then
                button.Text = Button
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(change)
