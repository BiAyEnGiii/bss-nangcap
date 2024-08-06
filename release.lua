
function autofarm(field,spin)
    repeat
        local num1, num2 = farm(field, "normal")
        if num1 == nil then
            return print("stop autofarm to farm another")
        end
    until tonumber(num1) >= tonumber(num2)
	print("full")
    convert()
end

function autofarmsp(field, object, objectcha)
    while objectcha:FindFirstChild(object.Name) do
        local num1, num2 = farm(field, "item",spin)
        if object:FindFirstChild("Health") then
            print(object.Health.Value, num1, num2)
        end
        if num1 ~= nil and num2 ~= nil then
            if tonumber(num1) >= tonumber(num2) then
                convert()
                return
            end
        end
    end    
    print("DONE!!")
end

function convert()
    for i, v in pairs(game.Workspace.Hives:GetChildren()) do
        if v.Platform.Top.Username.User.Text == "taikhoankiemtra2" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                v.Platform.Top.CFrame * CFrame.new(-4, 0, 0) * CFrame.fromEulerAngles(0, 0, math.rad(90))
        end
    end
    game.ReplicatedStorage.Remotes.MakeHoney:FireServer("")
    repeat
        wait(2)
        local num = game.Players.LocalPlayer.PlayerGui.Main.MeterHUD.PollenMeter.Bar.TextLabel.Text
        local num1, num2 = num:match("([^/]+)/([^/]+)")
        num1 = num1:gsub(",", "")
        num2 = num2:gsub(",", "")
        print(num1)
    until tonumber(num1) == 0
    print("EMPTY!!!!")
end



function farm(field, state)
    wait(2)
	print("start")
	print(field)
    local plrmag = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local fieldmag = game.Workspace.Fields[field].FieldBox.Position
    print(fieldmag)
	if (plrmag - fieldmag).magnitude > 100 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Fields[field].FieldBox.CFrame
    end
   -- print(field,spin)
  --[[  if spin == nil then makesprinkler(field)
    spin = field
    print("no place spinkler before!!!") end
    if spin ~= field and spin ~= "none" then makesprinkler(field)
     spin = field
     print("spinkler place in another field")
     wait(1)
     makesprinkler(field)
      end
    local checkhe = checkmap(def)
    if checkhe ~= def and state == "normal" then
        print("Found HEHE while farming")
        return
    end]]
    local turn = 0
    while turn < 10 do
        turn = turn + 1
					local clickevent = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChildOfClass("RemoteEvent")
			clickevent:fireServer()
        wait(.1)
        for i, v in pairs(game.Workspace.Debris.Tokens:GetChildren()) do
            --prioritize
            wait(.05)

            if v:WaitForChild("TokenName", 0.1) then
                local name = v:WaitForChild("TokenName", 0.1).Value
                if v.Name == "All" and name ~= "Honey" and name ~= "Royal Jelly" and name ~= "Treat" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    wait()
                    print("Collect item server!")
                end
                if v.Name == "taikhoankiemtra2" and (v.Position - fieldmag).magnitude < 100 and name == "TokenLink" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    wait()
                    print("Collect TokenLink!")
                end
                if v.Name == "taikhoankiemtra2" and (v.Position - fieldmag).magnitude < 100 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    wait()
                end
            end
        end
    end
    --check

    local num = game.Players.LocalPlayer.PlayerGui.Main.MeterHUD.PollenMeter.Bar.TextLabel.Text
    local num1, num2 = num:match("([^/]+)/([^/]+)")
    num1 = num1:gsub(",", "")
    num2 = num2:gsub(",", "")
    wait(1)
    return num1, num2
end
print("check")
if game.Workspace:FindFirstChild("Folder") then game.Workspace:FindFirstChild("Folder"):Destroy() end
if game.Workspace:FindFirstChild("Doors") then game.Workspace:FindFirstChild("Doors"):Destroy() end
if game.Workspace:FindFirstChild("AreaBarriers") then game.Workspace:FindFirstChild("AreaBarriers"):Destroy() end
 autofarm("Blueberry Field","normal")
while true do
    local def = "Spider Field"
  --  local field, state, object,objectcha = checkmap(def)
    --farmcrys()
	state = "normal"
    if state == "normal" then
        print("farm normal")
        wait(2)
        autofarm(def) -- nay la field nha do bo sprout di roi
    end
    if state == "item" then
        print("farm item")
        wait(2)
        autofarmsp(field, object,objectcha)
    end
end
