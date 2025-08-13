local notif = {}

function notif:Notification(title, desc, font, font2, visibletime)
    pcall(function()
        local RunService = game:GetService("RunService")

        local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
        screenGui.Name = title
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local instances = {
            ["UICorner_1"] = Instance.new("UICorner"),
            ["LocalScript_1"] = Instance.new("LocalScript"),
            ["Frame_2"] = Instance.new("Frame"),
            ["UICorner_2"] = Instance.new("UICorner"),
            ["TextLabel_1"] = Instance.new("TextLabel"),
            ["Frame_1"] = Instance.new("Frame"),
            ["TextLabel_2"] = Instance.new("TextLabel"),
            ["LocalScript_2"] = Instance.new("LocalScript"),
            ["TextButton_1"] = Instance.new("TextButton"),
        }

        -- Główna ramka
        instances.Frame_1.Parent = screenGui
        instances.Frame_1.Name = 'Main'
        instances.Frame_1.BackgroundColor3 = Color3.new(0.0666667, 0.0666667, 0.0666667)
        instances.Frame_1.BorderSizePixel = 0
        instances.Frame_1.Position = UDim2.new(1, 0, 0.509, 0)
        instances.Frame_1.Size = UDim2.new(0, 331, 0, 61)

        -- Lewy pasek
        instances.Frame_2.Parent = instances.Frame_1
        instances.Frame_2.BackgroundColor3 = Color3.new(0.0431373, 0.0431373, 0.0431373)
        instances.Frame_2.Size = UDim2.new(0, 11, 0, 61)
        instances.Frame_2.Name = 'Bar'

        instances.UICorner_1.Parent = instances.Frame_2
        instances.UICorner_1.CornerRadius = UDim.new(0, 10)

        instances.UICorner_2.Parent = instances.Frame_1
        instances.UICorner_2.CornerRadius = UDim.new(0, 7)

        local frame = instances.Frame_1

        -- Label 'Demonic' z metaliczną animacją falującego gradientu
        local demonicLabel = Instance.new("TextLabel")
        demonicLabel.Parent = frame
        demonicLabel.Font = Enum.Font[font]
        demonicLabel.Text = "Demonic"
        demonicLabel.TextSize = 14
        demonicLabel.TextXAlignment = Enum.TextXAlignment.Left
        demonicLabel.BackgroundTransparency = 1
        demonicLabel.Position = UDim2.new(0.088, 0, 0, 0)
        demonicLabel.Size = UDim2.new(0, 80, 0, 28)
        demonicLabel.Name = "DemonicLabel"
        demonicLabel.TextColor3 = Color3.fromRGB(255, 0, 0)

        local gradient = Instance.new("UIGradient")
        gradient.Parent = demonicLabel
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 200, 200)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 0))
        }

        RunService.RenderStepped:Connect(function()
            gradient.Offset = Vector2.new(math.sin(tick() * 2) * 0.5, 0)
        end)

        -- Label 'Songs' statyczny biały
        local songsLabel = Instance.new("TextLabel")
        songsLabel.Parent = frame
        songsLabel.Font = Enum.Font[font]
        songsLabel.Text = "Songs"
        songsLabel.TextSize = 14
        songsLabel.TextXAlignment = Enum.TextXAlignment.Left
        songsLabel.BackgroundTransparency = 1
        songsLabel.Position = UDim2.new(0.25, 0, 0, 0)
        songsLabel.Size = UDim2.new(0, 80, 0, 28)
        songsLabel.Name = "SongsLabel"
        songsLabel.TextColor3 = Color3.new(1, 1, 1)

        -- Opis
        instances.TextLabel_2.Parent = instances.Frame_1
        instances.TextLabel_2.Font = Enum.Font[font2]
        instances.TextLabel_2.Text = desc
        instances.TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
        instances.TextLabel_2.TextSize = 13
        instances.TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd
        instances.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
        instances.TextLabel_2.BackgroundTransparency = 1
        instances.TextLabel_2.Position = UDim2.new(0.086, 0, 0.604, 0)
        instances.TextLabel_2.Size = UDim2.new(0, 191, 0, 9)
        instances.TextLabel_2.Name = 'Description'

        -- Przycisk zamknięcia
        instances.TextButton_1.Parent = instances.Frame_1
        instances.TextButton_1.Font = Enum.Font.GothamSemibold
        instances.TextButton_1.Text = 'X'
        instances.TextButton_1.TextColor3 = Color3.new(1, 1, 1)
        instances.TextButton_1.TextSize = 18
        instances.TextButton_1.BackgroundTransparency = 1
        instances.TextButton_1.Position = UDim2.new(0.907, 0, 0, 0)
        instances.TextButton_1.Size = UDim2.new(0, 16, 0, 61)
        instances.TextButton_1.Name = 'Close'

        -- Skrypt przycisku zamknięcia
        instances.LocalScript_1.Parent = instances.TextButton_1

        function Code_LocalScript_1()
            local script = instances.LocalScript_1
            script.Parent.MouseButton1Down:Connect(function()
                script.Parent.Parent:TweenPosition(UDim2.new(50, 0, 0, 0), "InOut", "Sine", 7.2)
                wait(2)
                script.Parent.Parent.Parent:Destroy()
            end)
        end
        coroutine.wrap(Code_LocalScript_1)()

        -- Animacja pojawienia się UI
        instances.LocalScript_2.Parent = instances.Frame_1

        function Code_LocalScript_2()
            local script = instances.LocalScript_2
            local newpos = UDim2.new(0.82, 0, 0.507, 0)
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
