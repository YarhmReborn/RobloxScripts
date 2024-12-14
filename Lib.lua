if game.CoreGui:FindFirstChild("gradient_lib") then
    game.CoreGui.gradient_lib:Destroy()
end

local library = {windows = 0}
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "gradient_lib"
ScreenGui.Parent = game:GetService("CoreGui")

function library:Window(name)
    local window = {toggled = false, flags = {}}
    local Frame = Instance.new("ImageLabel")
    local UIGradient = Instance.new("UIGradient")
    local Title = Instance.new("TextLabel")
    local Toggle = Instance.new("ImageButton")
    local Container = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    library.windows = library.windows + 1
    Frame.Name = "Frame"
    Frame.Parent = ScreenGui
    Frame.BackgroundTransparency = 1.000
    Frame.Position = UDim2.new(0, (15 + ((190 * library.windows) - 190)), 0, 15)
    Frame.Size = UDim2.new(0, 180, 0, 227)
    Frame.Image = "rbxassetid://3570695787"
    Frame.ScaleType = Enum.ScaleType.Slice
    Frame.SliceCenter = Rect.new(100, 100, 100, 100)
    Frame.SliceScale = 0.06
    Frame.Active = true
    Frame.Draggable = true

    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 29, 29)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(66, 66, 66))
    }
    UIGradient.Rotation = 45
    UIGradient.Parent = Frame

    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundTransparency = 1.000
    Title.Size = UDim2.new(0, 180, 0, 30)
    Title.Font = Enum.Font.Gotham
    Title.Text = " " .. name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Toggle.Name = "Toggle"
    Toggle.Parent = Frame
    Toggle.BackgroundTransparency = 1.000
    Toggle.Position = UDim2.new(0, 152, 0, 2)
    Toggle.Size = UDim2.new(0, 22, 0, 22)
    Toggle.Image = "http://www.roblox.com/asset/?id=4845446011"

    local size = nil
    Toggle.MouseButton1Click:Connect(function()
        if not size then size = Frame.AbsoluteSize end
        window.toggled = not window.toggled
        Frame:TweenSize(
            window.toggled and UDim2.new(0, 180, 0, 30) or UDim2.new(0, size.X, 0, size.Y), 
            "Out", "Sine", 0.35, true
        )
    end)

    Container.Name = "Container"
    Container.Parent = Frame
    Container.BackgroundTransparency = 1.000
    Container.Position = UDim2.new(0, 0, 0, 30)
    Container.Size = UDim2.new(0, 180, 0, 197)
    Container.ZIndex = 2

    UIListLayout.Parent = Container
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local function reSize()
        local y = 34
        for _, v in pairs(Container:GetChildren()) do
            if v:IsA("Frame") or v:IsA("TextButton") or v:IsA("TextLabel") or v:IsA("TextBox") then
                y = y + v.AbsoluteSize.Y
            end
        end
        Frame.Size = UDim2.new(0, 180, 0, y)
        Container.Size = UDim2.new(0, 180, 0, y)
    end

    -- Button Function
    function window:Button(name, callback)
        local Button = Instance.new("TextButton")
        Button.Name = "Button"
        Button.Parent = Container
        Button.BackgroundTransparency = 1.000
        Button.Size = UDim2.new(0, 180, 0, 28)
        Button.Font = Enum.Font.Gotham
        Button.Text = "  " .. name
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 16.000
        Button.TextXAlignment = Enum.TextXAlignment.Left

        Button.MouseButton1Click:Connect(callback)
        reSize()
    end

    -- Text Box Function (for input)
    function window:Box(name, placeholder, callback)
        local Box = Instance.new("Frame")
        local TextBox = Instance.new("TextBox")
        local Label = Instance.new("TextLabel")

        Box.Name = "Box"
        Box.Parent = Container
        Box.Size = UDim2.new(0, 180, 0, 28)
        Box.BackgroundTransparency = 1.000

        Label.Name = "Label"
        Label.Parent = Box
        Label.Size = UDim2.new(0.4, 0, 1, 0)
        Label.Font = Enum.Font.Gotham
        Label.Text = "  " .. name
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.TextSize = 16.000
        Label.BackgroundTransparency = 1.000

        TextBox.Name = "TextBox"
        TextBox.Parent = Box
        TextBox.Size = UDim2.new(0.6, 0, 1, 0)
        TextBox.Position = UDim2.new(0.4, 0, 0, 0)
        TextBox.Font = Enum.Font.Gotham
        TextBox.PlaceholderText = placeholder
        TextBox.Text = ""
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.BackgroundTransparency = 1.000

        TextBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                callback(TextBox.Text)
            end
        end)
        reSize()
    end

    -- Checkbox Function
    function window:Checkbox(name, callback)
        local checked = false
        local Checkbox = Instance.new("Frame")
        local Label = Instance.new("TextLabel")
        local Toggle = Instance.new("TextButton")

        Checkbox.Name = "Checkbox"
        Checkbox.Parent = Container
        Checkbox.Size = UDim2.new(0, 180, 0, 28)
        Checkbox.BackgroundTransparency = 1

        Label.Name = "Label"
        Label.Parent = Checkbox
        Label.Text = name
        Label.Font = Enum.Font.Gotham
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Size = UDim2.new(0.8, 0, 1, 0)

        Toggle.Name = "Toggle"
        Toggle.Parent = Checkbox
        Toggle.Size = UDim2.new(0.2, 0, 1, 0)
        Toggle.Position = UDim2.new(0.8, 0, 0, 0)
        Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Toggle.Text = ""

        Toggle.MouseButton1Click:Connect(function()
            checked = not checked
            callback(checked)
        end)
        reSize()
    end

    -- Toggle Function
    function window:Toggle(name, initialState, callback)
        local toggled = initialState or false
        local Toggle = Instance.new("TextButton")
        Toggle.Name = "Toggle"
        Toggle.Parent = Container
        Toggle.Size = UDim2.new(0, 180, 0, 28)
        Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Toggle.Font = Enum.Font.Gotham
        Toggle.Text = "  " .. name
        Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        Toggle.TextSize = 16.000
        Toggle.TextXAlignment = Enum.TextXAlignment.Left

        Toggle.MouseButton1Click:Connect(function()
            toggled = not toggled
            callback(toggled)
        end)

        reSize()
    end

    -- Slider Function
    function window:Slider(name, min, max, default, callback)
        local Slider = Instance.new("Frame")
        local SliderButton = Instance.new("TextButton")
        local Label = Instance.new("TextLabel")

        Slider.Name = "Slider"
        Slider.Parent = Container
        Slider.Size = UDim2.new(0, 180, 0, 28)
        Slider.BackgroundTransparency = 1.000

        Label.Name = "Label"
        Label.Parent = Slider
        Label.Text = name
        Label.Font = Enum.Font.Gotham
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Size = UDim2.new(0.8, 0, 1, 0)

        SliderButton.Name = "SliderButton"
        SliderButton.Parent = Slider
        SliderButton.Size = UDim2.new(0.2, 0, 1, 0)
        SliderButton.Position = UDim2.new(0.8, 0, 0, 0)
        SliderButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

        SliderButton.MouseButton1Down:Connect(function()
            local initialPos = game:GetService("UserInputService"):GetMouseLocation().X
            local initialValue = default
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    local offset = game:GetService("UserInputService"):GetMouseLocation().X - initialPos
                    local value = math.clamp(initialValue + offset, min, max)
                    callback(value)
                end
            end)
        end)
        reSize()
    end

    -- Dropdown Function
    function window:Dropdown(name, options, callback)
        local Dropdown = Instance.new("TextButton")
        Dropdown.Name = "Dropdown"
        Dropdown.Parent = Container
        Dropdown.Size = UDim2.new(0, 180, 0, 28)
        Dropdown.Text = name
        Dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Dropdown.Font = Enum.Font.Gotham
        Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
        Dropdown.TextSize = 16.000
        Dropdown.TextXAlignment = Enum.TextXAlignment.Left

        local optionList = Instance.new("Frame")
        optionList.Parent = Dropdown
        optionList.Size = UDim2.new(1, 0, 0, #options * 28)
        optionList.BackgroundTransparency = 1

        for _, option in ipairs(options) do
            local optionButton = Instance.new("TextButton")
            optionButton.Parent = optionList
            optionButton.Size = UDim2.new(1, 0, 0, 28)
            optionButton.Text = option
            optionButton.BackgroundTransparency = 1
            optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            optionButton.Font = Enum.Font.Gotham

            optionButton.MouseButton1Click:Connect(function()
                callback(option)
                optionList.Visible = false
            end)
        end
        reSize()
    end

    return window
end
