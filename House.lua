local RunService = game:GetService("RunService")

local frame = Main  -- zakładam, że masz już 'Main' jako parent

-- Label dla "Demonic"
local demonicLabel = Instance.new("TextLabel")
demonicLabel.Parent = frame
demonicLabel.BackgroundTransparency = 1
demonicLabel.Position = UDim2.new(0.0339, 0, 0.0564, 0)
demonicLabel.Size = UDim2.new(0, 80, 0, 23)
demonicLabel.Font = Enum.Font.GothamSemibold
demonicLabel.Text = "Demonic"
demonicLabel.TextSize = 12
demonicLabel.TextXAlignment = Enum.TextXAlignment.Left
demonicLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  -- kolor bazowy pod gradient

local gradient = Instance.new("UIGradient")
gradient.Parent = demonicLabel
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 200, 200)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 0)),
}

RunService.RenderStepped:Connect(function()
    gradient.Offset = Vector2.new(math.sin(tick() * 2) * 0.5, 0)
end)

-- Label dla "Songs"
local songsLabel = Instance.new("TextLabel")
songsLabel.Parent = frame
songsLabel.BackgroundTransparency = 1
songsLabel.Position = UDim2.new(0.25, 0, 0.0564, 0)  -- przesunięcie obok demonicLabel
songsLabel.Size = UDim2.new(0, 80, 0, 23)
songsLabel.Font = Enum.Font.GothamSemibold
songsLabel.Text = "Songs"
songsLabel.TextSize = 12
songsLabel.TextXAlignment = Enum.TextXAlignment.Left
songsLabel.TextColor3 = Color3.new(1, 1, 1)  -- biały kolor

