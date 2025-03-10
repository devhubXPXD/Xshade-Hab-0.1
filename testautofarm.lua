
function TP(Pos)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
end

function ChackQuest()
	
end

function fastattack()
	    for i, v in ipairs(workspace.Enemies:GetChildren()) do
	if v.Name == "Bandit" then
		local args = {
    [1] = workspace.Enemies[v.Name],
    [2] = {},
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(unpack(args))

local args = {
    [1] = 0.1000000059604645
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack"):FireServer(unpack(args))
	     end
    end
end


function wait_mon(pos_a)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1084.3511962890625, 16.308116912841797, 1473.5643310546875)
end

while task.wait() do
for i, v in ipairs(workspace.Enemies:GetChildren()) do
	if v.Name == "Bandit" and v.Humanoid.Health and v.Humanoid.Health <= 0  then
		TP(v.HumanoidRootPart.CFrame * CFrame.new(0 , 7 ,0))
		fastattack()
		wait(0.2)
		--else
          --wait_mon()
		  --wait(1)
	   end
  end
end
