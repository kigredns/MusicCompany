local notif = {}

function notif:Notification(title, desc, font, font2, visibletime)
    pcall(function()
        local RunService = game:GetService("RunService")
        local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))

        local instances = {
            ["UICorner_1"] = Instance.new("UICorner"),
            ["LocalScript_1"] = Instance.new("LocalScript"),
            ["Frame_2"] = Instance.new("Frame"),
            ["UICorner_2"] = Instance.new("UICorner"),
            ["Frame_1"] = Instance.new("Frame"),
            ["TextLabel_2"] = Instance.new("TextLabel"),
            ["LocalScript_2"] = Instance.new("LocalScript"),
            ["TextButton_1"] = Instance.new("TextButton"),
        }

        screenGui.Name = title
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        instances.Frame_1.Parent = screenGui
        instances.Frame_1.Name = 'Main'

        instances.Frame_1.BackgroundColor3 = Color3.new(0.0666667, 0.0666667, 0.0666667)
        instances.Frame_1.BorderSizePixel = 0
        instances.Frame_1.Position = UDim2.new(1, 0, 0.5, 0)
        instances.Frame_1.Size = UDim2.new(0, 350, 0, 61) -- trochę szerszy, żeby mieściło się ładnie

        instances.Frame_2.Parent = instances.Frame_1
        instances.Frame_2.BackgroundColor3 = Color3.new(0.0431373, 0.0431373, 0.0431373)
        instances.Frame_2.Size = UDim2.new(0, 11, 0, 61)
        instances.Frame_2.Name = 'Bar'

        instances.UICorner_1.Parent = instances.Frame_2
        instances.UICorner_1.CornerRadius = UDim.new(0, 10)

        instances.UICorner_2.Parent = instances.Frame_1
        instances.UICorner_2.CornerRadius = UDim.new(0, 7)

        -- Label na "Song" (biały tekst)
        local songLabel = Instance.new("TextLabel")
        songLabel.Parent = instances.Frame_1
        songLabel.Font = Enum.Font[font]
        songLabel.Text = "Song"
        songLabel.TextColor3 = Color3.new(1, 1, 1) -- biały
        songLabel.TextSize = 18
        songLabel.TextXAlignment = Enum.TextXAlignment.Left
        songLabel.BackgroundTransparency = 1
        songLabel.Position = UDim2.new(0.09, 0, 0.15, 0)
        songLabel.Size = UDim2.new(0, 70, 0, 33)
        songLabel.Name = "SongLabel"

        -- Label na "Extra" (animowany czerwony metaliczny)
        local extraLabel = Instance.new("TextLabel")
        extraLabel.Parent = instances.Frame_1
        extraLabel.Font = Enum.Font[font]
        extraLabel.Text = "Extra"
        extraLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        extraLabel.TextSize = 18
        extraLabel.TextXAlignment = Enum.TextXAlignment.Left
        extraLabel.BackgroundTransparency = 1
        extraLabel.Position = UDim2.new(0.35, 0, 0.15, 0) -- zaraz obok "Song"
        extraLabel.Size = UDim2.new(0, 70, 0, 33)
        extraLabel.Name = "ExtraLabel"

        local gradient = Instance.new("UIGradient")
        gradient.Parent = extraLabel
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 200, 200)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 0))
        }

        RunService.RenderStepped:Connect(function()
            gradient.Offset = Vector2.new(math.sin(tick() * 2) * 0.5, 0)
        end)

        instances.TextLabel_2.Parent = instances.Frame_1
        instances.TextLabel_2.Font = Enum.Font[font2]
        instances.TextLabel_2.Text = desc
        instances.TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
        instances.TextLabel_2.TextSize = 13
        instances.TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd
        instances.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
        instances.TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
        instances.TextLabel_2.BackgroundTransparency = 1
        instances.TextLabel_2.Position = UDim2.new(0.09, 0, 0.65, 0)
        instances.TextLabel_2.Size = UDim2.new(0, 260, 0, 14)
        instances.TextLabel_2.Name = 'Description'

        instances.TextButton_1.Parent = instances.Frame_1
        instances.TextButton_1.Font = Enum.Font.GothamSemibold
        instances.TextButton_1.Text = 'X'
        instances.TextButton_1.TextColor3 = Color3.new(1, 1, 1)
        instances.TextButton_1.TextSize = 18
        instances.TextButton_1.BackgroundColor3 = Color3.new(1, 1, 1)
        instances.TextButton_1.BackgroundTransparency = 1
        instances.TextButton_1.Position = UDim2.new(0.92, 0, 0, 0)
        instances.TextButton_1.Size = UDim2.new(0, 16, 0, 61)
        instances.TextButton_1.Name = 'Close'

        instances.LocalScript_1.Parent = instances.TextButton_1

        instances.LocalScript_2.Parent = instances.Frame_1

        local DO_NOT_COPY_THIS_VARIABLE_001 = {}
        local DO_NOT_COPY_THIS_VARIABLE_002 = require

        local require = function(object)
            local module = DO_NOT_COPY_THIS_VARIABLE_001[object]

            if module then
                return DO_NOT_COPY_THIS_VARIABLE_001[object]()
            end

            return DO_NOT_COPY_THIS_VARIABLE_002(object)
        end

        function Code_LocalScript_1() --LocalScript
            local script = instances.LocalScript_1

            script.Parent.MouseButton1Down:Connect(function()
                script.Parent.Parent:TweenPosition(UDim2.new(50, 0, 0, 0), "InOut", "Sine", 7.2)
                wait(2)
                script.Parent.Parent.Parent:Destroy()
            end)
        end
        coroutine.wrap(Code_LocalScript_1)()

        function Code_LocalScript_2()
            local script = instances.LocalScript_2
            local newpos = UDim2.new(0.82, 0, 0.5, 0)

            script.Parent:TweenPosition(newpos, "InOut", "Sine", 0.5)
        end
        coroutine.wrap(Code_LocalScript_2)()

        wait(visibletime)
        instances.Frame_1:TweenPosition(UDim2.new(50, 0, 0, 0), "InOut", "Sine", 7.2)
        wait(2)
        screenGui:Destroy()
    end)
end

return notif
