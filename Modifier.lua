-- Credits: wum_ph | Narukisora | Obfuscated Line Is a Notification and i obfuscated it for credits ⚠️ Does Not Have Any Stealer!!

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v8,v9) local v10={};for v11=1, #v8 do v6(v10,v0(v4(v1(v2(v8,v11,v11 + 1 )),v1(v2(v9,1 + (v11% #v9) ,1 + (v11% #v9) + 1 )))%256 ));end return v5(v10);end game:GetService(v7("\226\215\218\55\242\190\213\57\196\202","\126\177\163\187\69\134\219\167")):SetCore(v7("\16\200\36\193\210\44\217\35\195\245\32\204\62\204\243\45","\156\67\173\74\165"),{[v7("\0\190\93\26\185","\38\84\215\41\118\220\70")]=v7("\125\25\38\27\248\89\19\48\82\221\66\19\38\27\234\67","\158\48\118\66\114"),[v7("\159\33\8\34","\155\203\68\112\86\19\197")]=v7("\107\220\50\249\0\90\252\184\102\234\35\232\65\112\224\244","\152\38\189\86\156\32\24\133"),[v7("\216\66\181\71\232\94\168\72","\38\156\55\199")]=4 -1 });

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
