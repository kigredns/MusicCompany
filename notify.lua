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
            ["TextButton_1"] = Instance.new("TextButton"),
            -- Usuwam TextLabel_1 i TextLabel_2, bo tworzymy je dynamicznie
        }

        screenGui.Name = title
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        instances.Frame_1.Parent = screenGui
        instances.Frame_1.Name = 'Main'

        instances.Frame_1.BackgroundColor3 = Color3.new(0.0666667, 0.0666667, 0.0666667)
        instances.Frame_1.BorderSizePixel = 0
        instances.Frame_1.Position = UDim2.new(1, 0, 0.5, 0)
        instances.Frame_1.Size = UDim2.new(0, 400, 0, 90) -- większy frame, więcej miejsca na tekst

        instances.Frame_2.Parent = instances.Frame_1
        instances.Frame_2.BackgroundColor3 = Color3.new(0.0431373, 0.0431373, 0.0431373)
        instances.Frame_2.Size = UDim2.new(0, 11, 0, 90)
        instances.Frame_2.Name = 'Bar'

        instances.UICorner_1.Parent = instances.Frame_2
        instances.UICorner_1.CornerRadius = UDim.new(0, 10)

        instances.UICorner_2.Parent = instances.Frame_1
        instances.UICorner_2.CornerRadius = UDim.new(0, 7)

        -- Label "Song" (biały)
        local songLabel = Instance.new("TextLabel")
        songLabel.Parent = instances.Frame_1
        songLabel.Font = Enum.Font[font]
        songLabel.Text = "Song"
        songLabel.TextColor3 = Color3.new(1, 1, 1) -- biały
        songLabel.TextSize = 20
        songLabel.TextXAlignment = Enum.TextXAlignment.Left
        songLabel.BackgroundTransparency = 1
        songLabel.Position = UDim2.new(0.07, 0, 0.1, 0)
        songLabel.Size = UDim2.new(0, 80, 0, 30)
        songLabel.Name = "SongLabel"

        -- Label "Extra" (czerwony metaliczny animowany)
        local extraLabel = Instance.new("TextLabel")
        extraLabel.Parent = instances.Frame_1
        extraLabel.Font = Enum.Font[font]
        extraLabel.Text = "Extra"
        extraLabel.TextSize = 20
        extraLabel.TextXAlignment = Enum.TextXAlignment.Left
        extraLabel.BackgroundTransparency = 1
        extraLabel.Position = UDim2.new(0.25, 0, 0.1, 0)
        extraLabel.Size = UDim2.new(0, 80, 0, 30)
        extraLabel.Name = "ExtraLabel"

        local gradient = Instance.new("UIGradient")
        gradient.Parent = extraLabel
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 100)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 0))
        }

        RunService.RenderStepped:Connect(function()
            gradient.Offset = Vector2.new(math.sin(tick() * 3) * 0.5, 0)
        end)

        -- Opis (desc) - teraz z zawijaniem i większy
        local descLabel = Instance.new("TextLabel")
        descLabel.Parent = instances.Frame_1
        descLabel.Font = Enum.Font[font2]
        descLabel.Text = desc
        descLabel.TextColor3 = Color3.new(1, 1, 1)
        descLabel.TextSize = 16
        descLabel.TextWrapped = true
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        descLabel.BackgroundTransparency = 1
        descLabel.Position = UDim2.new(0.07, 0, 0.55, 0)
        descLabel.Size = UDim2.new(0, 320, 0, 30)
        descLabel.Name = "Description"

        -- Przycisk zamknięcia
        instances.TextButton_1.Parent = instances.Frame_1
        instances.TextButton_1.Font = Enum.Font.GothamSemibold
        instances.TextButton_1.Text = 'X'
        instances.TextButton_1.TextColor3 = Color3.new(1, 1, 1)
        instances.TextButton_1.TextSize = 24
        instances.TextButton_1.BackgroundColor3 = Color3.new(1, 1, 1)
        instances.TextButton_1.BackgroundTransparency = 1
        instances.TextButton_1.Position = UDim2.new(0.9, 0, 0, 0)
        instances.TextButton_1.Size = UDim2.new(0, 30, 0, 90)
        instances.TextButton_1.Name = 'Close'

        instances.LocalScript_1.Parent = instances.TextButton_1
        instances.LocalScript_2.Parent = instances.Frame_1

        function Code_LocalScript_1() --LocalScript zamykający notyfikację po kliknięciu X
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
