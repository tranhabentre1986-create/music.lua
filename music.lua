local Player = game.Players.LocalPlayer

local Gui = Instance.new("ScreenGui")
Gui.Parent = Player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Parent = Gui
Frame.Size = UDim2.new(0,260,0,210)
Frame.Position = UDim2.new(0.5,-130,0.5,-105)
Frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,30)
Title.BackgroundTransparency = 1
Title.Text = "🎵 Music Player"
Title.TextColor3 = Color3.new(1,1,1)

local Box = Instance.new("TextBox")
Box.Parent = Frame
Box.Size = UDim2.new(0,220,0,35)
Box.Position = UDim2.new(0,20,0,40)
Box.PlaceholderText = "Nhập ID nhạc..."

local Play = Instance.new("TextButton")
Play.Parent = Frame
Play.Size = UDim2.new(0,100,0,35)
Play.Position = UDim2.new(0,20,0,85)
Play.Text = "▶ Phát"

local Stop = Instance.new("TextButton")
Stop.Parent = Frame
Stop.Size = UDim2.new(0,100,0,35)
Stop.Position = UDim2.new(0,140,0,85)
Stop.Text = "⏹ Dừng"

local VolumeBox = Instance.new("TextBox")
VolumeBox.Parent = Frame
VolumeBox.Size = UDim2.new(0,220,0,35)
VolumeBox.Position = UDim2.new(0,20,0,130)
VolumeBox.PlaceholderText = "Âm lượng (0 - 10)"
VolumeBox.Text = "1"

local Sound = Instance.new("Sound")
Sound.Parent = workspace

Play.MouseButton1Click:Connect(function()
	if Box.Text ~= "" then
		Sound:Stop()
		Sound.SoundId = "rbxassetid://" .. Box.Text

		local v = tonumber(VolumeBox.Text)
		if v then
			Sound.Volume = math.clamp(v, 0, 10)
		end

		Sound:Play()
	end
end)

Stop.MouseButton1Click:Connect(function()
	Sound:Stop()
end)
