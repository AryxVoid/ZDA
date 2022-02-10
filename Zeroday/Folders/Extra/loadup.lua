local zinit = {}


zinit.intro = function()
	local ScreenGui = Instance.new("ScreenGui")
	local bg = Instance.new("ImageLabel")
	local loaderbar = Instance.new("ImageLabel")
	local progress = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local info = Instance.new("TextLabel")

	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	bg.Name = "bg"
	bg.Parent = ScreenGui
	bg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bg.BackgroundTransparency = 1.000
	bg.Position = UDim2.new(0.236354262, 0, -0.145422757, 0)
	bg.Size = UDim2.new(0, 951, 0, 467)
	bg.Image = "rbxassetid://8772055121"
	bg.ImageTransparency = 1.000

	loaderbar.Name = "loaderbar"
	loaderbar.Parent = bg
	loaderbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	loaderbar.BackgroundTransparency = 1.000
	loaderbar.Position = UDim2.new(0.102667317, 0, 0.361337066, 0)
	loaderbar.Size = UDim2.new(0, 786, 0, 425)
	loaderbar.Image = "rbxassetid://8772132615"
	loaderbar.ImageTransparency = 1.000

	progress.Name = "progress"
	progress.Parent = loaderbar
	progress.BackgroundColor3 = Color3.fromRGB(124, 50, 212)
	progress.BackgroundTransparency = 1.000
	progress.BorderSizePixel = 0
	progress.Position = UDim2.new(0.23918575, 0, 0.458823532, 0)
	progress.Size = UDim2.new(0, 409, 0, 11)

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = progress

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 236, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(77, 99, 96)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(62, 28, 102))}
	UIGradient.Parent = progress

	info.Name = "info"
	info.Parent = progress
	info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	info.BackgroundTransparency = 1.000
	info.Position = UDim2.new(0.0415647924, 0, -2.909091, 0)
	info.Size = UDim2.new(0, 370, 0, 28)
	info.Font = Enum.Font.GothamBold
	info.Text = ""
	info.TextColor3 = Color3.fromRGB(255, 255, 255)
	info.TextSize = 14.000
	info.TextTransparency = 1.000

	-- Scripts:

	local function ISQCDM_fake_script() -- progress.HoverStay 
		local script = Instance.new('LocalScript', progress)

		local button = script.Parent
		local gradient = button.UIGradient
		local ts = game:GetService("TweenService")
		local ti = TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		local offset1 = {Offset = Vector2.new(-1, 0)}
		local create1 = ts:Create(gradient, ti, offset1)
		local startPos = Vector2.new(1, 0)
		local rot = 180

		gradient.Offset = startPos
		gradient.Rotation = 0



		button.BorderSizePixel = 2
		create1:Play()


		local function completed()

			if button.BorderSizePixel == 2 and rot == 0 then

				gradient.Rotation = 180
				gradient.Offset = startPos
				create1:Play()	

			elseif button.BorderSizePixel == 2 and rot == 180 then

				gradient.Rotation = 0
				gradient.Offset = startPos
				create1:Play()

			end

		end

		create1.Completed:Connect(function() 

			if rot == 0 then rot = 180 elseif rot == 180 then rot = 0 end
			completed()

		end)




	end
	coroutine.wrap(ISQCDM_fake_script)()
	local function OMNVE_fake_script() -- ScreenGui.LocalScript 
		local script = Instance.new('LocalScript', ScreenGui)

		local tween = game:GetService'TweenService'
		local blur = Instance.new('BlurEffect', game.Lighting)
		bg = script.Parent.bg
		loaderbar = bg.loaderbar
		progress = loaderbar.progress
		local infot = progress.info

		info = {
			tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		}

		local zutil = {}

		zutil.intro = function()
			tween:Create(blur,TweenInfo.new(1),{Size = 40}):Play()
			wait(0.32)
			tween:Create(bg,info.tweenInfo,{Position = UDim2.new(0.236, 0,0.267, 0, "Out", "Bounce")}):Play()
			wait(.2)
			tween:Create(bg,info.tweenInfo,{ImageTransparency = 0}):Play()
			wait(1.2)
			tween:Create(loaderbar, info.tweenInfo,{ImageTransparency = 0}):Play()
			wait(0.52)
			tween:Create(progress, info.tweenInfo,{BackgroundTransparency = 0}):Play()
			wait(0.52)
			tween:Create(infot, info.tweenInfo,{TextTransparency = 0}):Play()
			infot.Text = "Checking Zday_Config File..."
			wait(4)
			tween:Create(infot, info.tweenInfo,{TextTransparency = 1}):Play()
			wait(0.52)
			tween:Create(infot, info.tweenInfo,{TextTransparency = 0}):Play()
			infot.Text = "Zero Day Ready."
			wait(4.2)
			tween:Create(loaderbar, info.tweenInfo,{ImageTransparency = 1}):Play()
			wait(0.52)
			tween:Create(progress, info.tweenInfo,{BackgroundTransparency = 1}):Play()
			wait(0.52)
			tween:Create(infot, info.tweenInfo,{TextTransparency = 1}):Play()
			wait(1.2)
			tween:Create(bg,info.tweenInfo,{Position = UDim2.new(0.236, 0,-0.145, 0, "Out", "Bounce")}):Play()
			wait(.5)
			script.Parent:Destroy()
			blur:Destroy()
		end

	end
	coroutine.wrap(OMNVE_fake_script)()
end




return zinit
