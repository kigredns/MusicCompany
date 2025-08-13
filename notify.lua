local notif = {}

function notif:Notification(title, desc, font, font2, visibletime)
    pcall(function()
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = title
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        screenGui.Parent = game:GetService("CoreGui")

        local instances = {
            ["UICorner_1"] = Instance.new("UICorner"),
            ["Frame_2"] = Instance.new("Frame"),
            ["UICorner_2"] = Instance.new("UICorner"),
            ["TextLabel_1"] = Instance.new("TextLabel"), 
            ["TextLabel_2"] = Instance.new("TextLabel"), 
            ["TextLabel_3"] = Instance.new("TextLabel"), 
            ["TextButton_1"] = Instance.new("TextButton"),
        }

        instances.Frame_1 = Instance.new("Frame")
        instances.Frame_1.Name = "Main"
        instances.Frame_1.Parent = screenGui
        instances.Frame_1.BackgroundColor3 = Color3.new(0.0666667, 0.0666667, 0.0666667)
        instances.Frame_1.BorderSizePixel = 0
        instances.Frame_1.Position = UDim2.new(1, 0, 0.509, 0)
        instances.Frame_1.Size = UDim2.new(0, 331, 0, 61)

        instances.Frame_2.Parent = instances.Frame_1
        instances.Frame_2.Name = "Bar"
        instances.Frame_2.BackgroundColor3 = Color3.new(0.0431373, 0.0431373, 0.0431373)
        instances.Frame_2.Size = UDim2.new(0, 11, 0, 61)

        instances.UICorner_1.Parent = instances.Frame_2
        instances.UICorner_1.CornerRadius = UDim.new(0, 10)

        instances.UICorner_2.Parent = instances.Frame_1
        instances.UICorner_2.CornerRadius = UDim.new(0, 7)

        local frame = instances.Frame_1

        local demonicLabel = instances.TextLabel_1
        demonicLabel.Parent = frame
        demonicLabel.Name = "DemonicLabel"
        demonicLabel.Font = Enum.Font[font]
        demonicLabel.Text = "Demonic"
        demonicLabel.TextSize = 14
        demonicLabel.TextXAlignment = Enum.TextXAlignment.Left
        demonicLabel.BackgroundTransparency = 1
        demonicLabel.Position = UDim2.new(0.088, 0, 0, 0)
        demonicLabel.Size = UDim2.new(0, 80, 0, 28)
        demonicLabel.TextColor3 = Color3.fromRGB(180, 0, 0)

        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 0, 0)),
            ColorSequenceKeypoint.new(0.45, Color3.fromRGB(180, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 100)),
            ColorSequenceKeypoint.new(0.55, Color3.fromRGB(180, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 0, 0)),
        }
        gradient.Rotation = 0
        gradient.Parent = demonicLabel

        local songsLabel = instances.TextLabel_3
        songsLabel.Parent = frame
        songsLabel.Name = "SongsLabel"
        songsLabel.Font = Enum.Font[font]
        songsLabel.Text = "Songs"
        songsLabel.TextSize = 14
        songsLabel.TextXAlignment = Enum.TextXAlignment.Left
        songsLabel.BackgroundTransparency = 1
        songsLabel.Position = UDim2.new(0.25, 0, 0, 0)
        songsLabel.Size = UDim2.new(0, 80, 0, 28)
        songsLabel.TextColor3 = Color3.new(1, 1, 1)

        local descriptionLabel = instances.TextLabel_2
        descriptionLabel.Parent = frame
        descriptionLabel.Name = "Description"
        descriptionLabel.Font = Enum.Font[font2]
        descriptionLabel.Text = desc
        descriptionLabel.TextColor3 = Color3.new(1, 1, 1)
        descriptionLabel.TextSize = 13
        descriptionLabel.TextTruncate = Enum.TextTruncate.AtEnd
        descriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
        descriptionLabel.BackgroundTransparency = 1
        descriptionLabel.Position = UDim2.new(0.086, 0, 0.604, 0)
        descriptionLabel.Size = UDim2.new(0, 191, 0, 9)

        local closeButton = instances.TextButton_1
        closeButton.Parent = frame
        closeButton.Name = "Close"
        closeButton.Font = Enum.Font.GothamSemibold
        closeButton.Text = "X"
        closeButton.TextColor3 = Color3.new(1, 1, 1)
        closeButton.TextSize = 18
        closeButton.BackgroundColor3 = Color3.new(1, 1, 1)
        closeButton.BackgroundTransparency = 1
        closeButton.Position = UDim2.new(0.907, 0, 0, 0)
        closeButton.Size = UDim2.new(0, 16, 0, 61)

        local RunService = game:GetService("RunService")
        local offset = 0
        local speed = 0.2
        local heartbeatConnection

        heartbeatConnection = RunService.Heartbeat:Connect(function(dt)
            offset = offset + dt * speed
            if offset > 1 then
                offset = offset - 1
            end
            gradient.Offset = Vector2.new(offset, 0)
        end)

        closeButton.MouseButton1Down:Connect(function()
            heartbeatConnection:Disconnect()
            frame:TweenPosition(UDim2.new(1.5, 0, frame.Position.Y.Scale, frame.Position.Y.Offset), "InOut", "Sine", 0.5, true, function()
                screenGui:Destroy()
            end)
        end)
        frame:TweenPosition(UDim2.new(0.68, 0, 0.509, 0), "InOut", "Sine", 0.5)

        spawn(function()
            wait(visibletime)
            if heartbeatConnection.Connected then
                heartbeatConnection:Disconnect()
            end
            frame:TweenPosition(UDim2.new(1.5, 0, frame.Position.Y.Scale, frame.Position.Y.Offset), "InOut", "Sine", 0.5, true, function()
                screenGui:Destroy()
            end)
        end)
    end)
end

return notif
