if game.CoreGui:FindFirstChild("gradient_lib") then
    game.CoreGui.gradient_lib:Destroy()
end

local library = {windows = 0}
local ScreenGui = Instance.new("ScreenGui")

function library:Window(name)
    local window = {toggled = false, flags = {}}
    local Frame = Instance.new("ImageLabel")
    local UIGradient = Instance.new("UIGradient")
    local Title = Instance.new("TextLabel")
    local Toggle = Instance.new("ImageButton")
    local Container = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    library.windows = library.windows + 1

    ScreenGui.Name = "gradient_lib"
    ScreenGui.Parent = game:GetService("CoreGui")

    Frame.Name = "Frame"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
    Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.BackgroundTransparency = 1.000
    Toggle.Position = UDim2.new(0, 152, 0, 2)
    Toggle.Size = UDim2.new(0, 22, 0, 22)
    Toggle.Image = "http://www.roblox.com/asset/?id=4845446011"
    local size = nil
    Toggle.MouseButton1Click:Connect(function()
        if not size then size = Frame.AbsoluteSize end
        if not window.toggled then Frame.ClipsDescendants = true end
        window.toggled = not window.toggled
        game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.35), {Rotation = window.toggled and 90 or 0}):Play()
        Frame:TweenSize(
            window.toggled and UDim2.new(0, 180, 0, 30) or UDim2.new(0, size.X, 0, size.Y), 
            "Out", "Sine", .35, true
        )
        wait(.35)
        if window.toggled then Container.ClipsDescendants = false end
    end)

    Container.Name = "Container"
    Container.Parent = Frame
    Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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

    -- Functions for Buttons, Labels, and Checkboxes (Existing)
    function window:Button(name, callback)
        local Button = Instance.new("TextButton")
        Button.Name = "Button"
        Button.Parent = Container
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 1.000
        Button.Size = UDim2.new(0, 180, 0, 28)
        Button.Font = Enum.Font.Gotham
        Button.Text = "  " .. name
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 16.000
        Button.TextXAlignment = Enum.TextXAlignment.Left

        Button.MouseButton1Click:Connect(function()
            callback()
        end)
        reSize()
    end

    function window:Toggle(name, default, callback)
        local toggled = default
        local ToggleFrame = Instance.new("Frame")
        local Label = Instance.new("TextLabel")
        local ToggleButton = Instance.new("TextButton")

        ToggleFrame.Parent = Container
        ToggleFrame.Size = UDim2.new(0, 180, 0, 28)
        ToggleFrame.BackgroundTransparency = 1

        Label.Name = "Label"
        Label.Parent = ToggleFrame
        Label.Text = name
        Label.Font = Enum.Font.Gotham
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Size = UDim2.new(0.8, 0, 1, 0)

        ToggleButton.Name = "ToggleButton"
        ToggleButton.Parent = ToggleFrame
        ToggleButton.Size = UDim2.new(0.2, 0, 1, 0)
        ToggleButton.Position = UDim2.new(0.8, 0, 0, 0)
        ToggleButton.BackgroundColor3 = toggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        ToggleButton.Text = ""

        ToggleButton.MouseButton1Click:Connect(function()
            toggled = not toggled
            ToggleButton.BackgroundColor3 = toggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            callback(toggled)
        end)
        reSize()
    end

    -- Add Slider Function
    function window:Slider(name, min, max, default, callback)
        local sliderValue = default
        local SliderFrame = Instance.new("Frame")
        local Label = Instance.new("TextLabel")
        local SliderBar = Instance.new("Frame")
        local SliderButton = Instance.new("TextButton")

        SliderFrame.Parent = Container
        SliderFrame.Size = UDim2.new(0, 180, 0, 28)
        SliderFrame.BackgroundTransparency = 1

        Label.Name = "Label"
        Label.Parent = SliderFrame
        Label.Text = name .. ": " .. default
        Label.Font = Enum.Font.Gotham
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Size = UDim2.new(0.6, 0, 1, 0)

        SliderBar.Name = "SliderBar"
        SliderBar.Parent = SliderFrame
        SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        SliderBar.Size = UDim2.new(0.35, 0, 0.3, 0)
        SliderBar.Position = UDim2.new(0.6, 0, 0.35, 0)

        SliderButton.Name = "SliderButton"
        SliderButton.Parent = SliderBar
        SliderButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
        SliderButton.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)

        SliderBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local connection
                connection = game:GetService("UserInputService").InputChanged:Connect(function(move)
                    if move.UserInputType == Enum.UserInputType.MouseMovement then
                        local mousePos = move.Position.X
                        local sliderPos = SliderBar.AbsolutePosition.X
                        local sliderSize = SliderBar.AbsoluteSize.X
                        local percent = math.clamp((mousePos - sliderPos) / sliderSize, 0, 1)
                        sliderValue = math.floor(min + (max - min) * percent)
                        SliderButton.Size = UDim2.new(percent, 0, 1, 0)
                        Label.Text = name .. ": " .. sliderValue
                        callback(sliderValue)
                    end
                end)

                game:GetService("UserInputService").InputEnded:Connect(function(endInput)
                    if endInput.UserInputType == Enum.UserInputType.MouseButton1 then
                        connection:Disconnect()
                    end
                end)
            end
        end)
        reSize()
    end

    -- Add Dropdown Function
    function window:Dropdown(name, options, callback)
        local DropdownFrame = Instance.new("Frame")
        local Label = Instance.new("TextLabel")
        local DropdownButton = Instance.new("TextButton")
        local OptionsFrame = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local selected = options[1]

        DropdownFrame.Parent = Container
        DropdownFrame.Size = UDim2.new(0, 180, 0, 28)
        DropdownFrame.BackgroundTransparency = 1

        Label.Name = "Label"
        Label.Parent = DropdownFrame
        Label.Text = name .. ": " .. selected
        Label.Font = Enum.Font.Gotham
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Size = UDim2.new(0.6, 0, 1, 0)

        DropdownButton.Name = "DropdownButton"
        DropdownButton.Parent = DropdownFrame
        DropdownButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        DropdownButton.Size = UDim2.new(0.4, 0, 1, 0)
        DropdownButton.Position = UDim2.new(0.6, 0, 0, 0)
        DropdownButton.Text = "▼"

        OptionsFrame.Name = "OptionsFrame"
        OptionsFrame.Parent = DropdownFrame
        OptionsFrame.Visible = false
        OptionsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        OptionsFrame.Size = UDim2.new(1, 0, 0, #options * 20)
        OptionsFrame.Position = UDim2.new(0, 0, 1, 0)

        UIListLayout.Parent = OptionsFrame
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        for _, option in ipairs(options) do
            local OptionButton = Instance.new("TextButton")
            OptionButton.Parent = OptionsFrame
            OptionButton.Text = option
            OptionButton.Font = Enum.Font.Gotham
            OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            OptionButton.Size = UDim2.new(1, 0, 0, 20)
            OptionButton.BackgroundTransparency = 1

            OptionButton.MouseButton1Click:Connect(function()
                selected = option
                Label.Text = name .. ": " .. selected
                OptionsFrame.Visible = false
                callback(selected)
            end)
        end

        DropdownButton.MouseButton1Click:Connect(function()
            OptionsFrame.Visible = not OptionsFrame.Visible
        end)
        reSize()
    end

    -- Add Keybind Function
    function window:Keybind(name, defaultKey, callback)
        local keybind = defaultKey
        local KeybindFrame = Instance.new("Frame")
        local Label = Instance.new("TextLabel")
        local KeybindButton = Instance.new("TextButton")

        KeybindFrame.Parent = Container
        KeybindFrame.Size = UDim2.new(0, 180, 0, 28)
        KeybindFrame.BackgroundTransparency = 1

        Label.Name = "Label"
        Label.Parent = KeybindFrame
        Label.Text = name .. ": [" .. tostring(defaultKey) .. "]"
        Label.Font = Enum.Font.Gotham
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Size = UDim2.new(0.6, 0, 1, 0)

        KeybindButton.Name = "KeybindButton"
        KeybindButton.Parent = KeybindFrame
        KeybindButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        KeybindButton.Size = UDim2.new(0.4, 0, 1, 0)
        KeybindButton.Position = UDim2.new(0.6, 0, 0, 0)
        KeybindButton.Text = "Set"

        KeybindButton.MouseButton1Click:Connect(function()
            Label.Text = name .. ": [Press Key]"
            local connection
            connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    keybind = input.KeyCode
                    Label.Text = name .. ": [" .. tostring(keybind) .. "]"
                    callback(keybind)
                    connection:Disconnect()
                end
            end)
        end)
        reSize()
    end

    reSize()
    return window
end
