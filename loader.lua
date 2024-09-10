local Players = game:GetService("Players")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Dolphin Hub",
   LoadingTitle = "Loading the Hub",
   LoadingSubtitle = "By Medium / ChatGPT",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "dolphin1",
      FileName = "Dolphin-Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "we not doing invites yet",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Dolphin Hub",
      Subtitle = "Key System",
      Note = "Key is 'dolphin'!",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"dolphin"}
   }
})
local exploitTab = Window:CreateTab("Exploits")
local Players = game:GetService("Players")
local IYMouse = Players.LocalPlayer:GetMouse() -- Getting the mouse input

FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1

-- Function to get the HumanoidRootPart
local function getRoot(char)
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
end

-- Main flying function
function sFLY(vfly)
    repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    
    if flyKeyDown or flyKeyUp then 
        flyKeyDown:Disconnect() 
        flyKeyUp:Disconnect() 
    end

    local T = getRoot(Players.LocalPlayer.Character)
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0

    local function FLY()
        FLYING = true
        local BG = Instance.new('BodyGyro')
        local BV = Instance.new('BodyVelocity')
        BG.P = 9e4
        BG.Parent = T
        BV.Parent = T
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.CFrame = T.CFrame
        BV.Velocity = Vector3.new(0, 0, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)

        task.spawn(function()
            repeat
                wait()
                if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                    Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = 50
                else
                    SPEED = 0
                end
                BV.Velocity = ((workspace.CurrentCamera.CFrame.lookVector * (CONTROL.F + CONTROL.B)) + 
                ((workspace.CurrentCamera.CFrame * CFrame.new(CONTROL.L + CONTROL.R, 
                (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CFrame.p)) * SPEED
                BG.CFrame = workspace.CurrentCamera.CFrame
            until not FLYING
            CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            SPEED = 0
            BG:Destroy()
            BV:Destroy()
            if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
            end
        end)
    end

    flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY:lower() == 's' then
            CONTROL.B = -(vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY:lower() == 'a' then
            CONTROL.L = -(vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY:lower() == 'd' then
            CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
        elseif QEfly and KEY:lower() == 'e' then
            CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed) * 2
        elseif QEfly and KEY:lower() == 'q' then
            CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed) * 2
        end
    end)

    flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = 0
        elseif KEY:lower() == 's' then
            CONTROL.B = 0
        elseif KEY:lower() == 'a' then
            CONTROL.L = 0
        elseif KEY:lower() == 'd' then
            CONTROL.R = 0
        elseif KEY:lower() == 'e' then
            CONTROL.Q = 0
        elseif KEY:lower() == 'q' then
            CONTROL.E = 0
        end
    end)

    FLY()
end
function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end
local function bhop()
    	local Char = speaker.Character
	local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
	local function autoJump()
		if Char and Human then
			local check1 = workspace:FindPartOnRay(Ray.new(Human.RootPart.Position-Vector3.new(0,1.5,0), Human.RootPart.CFrame.lookVector*3), Human.Parent)
			local check2 = workspace:FindPartOnRay(Ray.new(Human.RootPart.Position+Vector3.new(0,1.5,0), Human.RootPart.CFrame.lookVector*3), Human.Parent)
			if check1 or check2 then
				Human.Jump = true
			end
		end
	end
	autoJump()
	HumanModCons.ajLoop = (HumanModCons.ajLoop and HumanModCons.ajLoop:Disconnect() and false) or RunService.RenderStepped:Connect(autoJump)
	HumanModCons.ajCA = (HumanModCons.ajCA and HumanModCons.ajCA:Disconnect() and false) or speaker.CharacterAdded:Connect(function(nChar)
		Char, Human = nChar, nChar:WaitForChild("Humanoid")
		autoJump()
		HumanModCons.ajLoop = (HumanModCons.ajLoop and HumanModCons.ajLoop:Disconnect() and false) or RunService.RenderStepped:Connect(autoJump)
	end)
end
local function unbhop()
    	HumanModCons.ajLoop = (HumanModCons.ajLoop and HumanModCons.ajLoop:Disconnect() and false) or nil
	HumanModCons.ajCA = (HumanModCons.ajCA and HumanModCons.ajCA:Disconnect() and false) or nil
end
exploitTab:CreateButton({
    Name = "Fly",
    Callback = function()
        NOFLY()
        wait()
        sFLY()
    end
})
exploitTab:CreateButton({
    Name = "Unfly",
    Callback = function()
        NOFLY()
    end
})
exploitTab:CreateButton({
    Name = "Vehicle Fly",
    Callback = function()
        NOFLY()
        wait()
        sFLY(true)
    end
})
exploitTab:CreateButton({
    Name = "Un-Vehicle Fly",
    Callback = function()
        NOFLY()
    end
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local speaker = Players.LocalPlayer
local Clip = true
local Noclipping

-- Function to enable noclip
exploitTab:CreateButton({
    Name = "Noclip",
    Callback = function()
        Clip = false  -- Enable noclip
        wait(0.1)

        local function NoclipLoop()
            if not Clip and speaker.Character then
                for _, child in pairs(speaker.Character:GetDescendants()) do
                    if child:IsA("BasePart") and child.CanCollide then
                        child.CanCollide = false
                    end
                end
            end
        end

        -- If not already running, start the Noclip loop
        if not Noclipping then
            Noclipping = RunService.Stepped:Connect(NoclipLoop)
        end
        Rayfield:Notify({
            Title = "Dolphin Hub",
            Content = "Noclipping has been enabled.",
            Duration = 3
        })
    end
})

-- Function to disable noclip
exploitTab:CreateButton({
    Name = "Un-Noclip",
    Callback = function()
        Clip = true  -- Disable noclip

        -- Restore collision for character parts
        if speaker.Character then
            for _, child in pairs(speaker.Character:GetDescendants()) do
                if child:IsA("BasePart") then
                    child.CanCollide = true
                end
            end
        end

        -- Disconnect the loop
        if Noclipping then
            Noclipping:Disconnect()
            Noclipping = nil
        end
        Rayfield:Notify({
            Title = "Dolphin Hub",
            Content = "Noclipping has disabled.",
            Duration = 3
        })
    end
})
exploitTab:CreateButton({
    Name = "Delete Car",
    Callback = function()
        	vnoclipParts = {}
	local seat = speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart
	local vehicleModel = seat.Parent
	repeat
		if vehicleModel.ClassName ~= "Model" then
			vehicleModel = vehicleModel.Parent
		end
	until vehicleModel.ClassName == "Model"
	wait(0.1)
	for i,v in pairs(vehicleModel:GetDescendants()) do
		if v:IsA("BasePart") and v.CanCollide then
			table.insert(vnoclipParts,v)
			v.CanCollide = false
		end
	end
	Players.LocalPlayer.Character.Humanoid.Jump = true
	end
})
exploitTab:CreateButton({
     Name = "Remove Dolphin Hub",
     Callback = function()
        game:GetService("CoreGui").Rayfield:Destroy()
    end
})
