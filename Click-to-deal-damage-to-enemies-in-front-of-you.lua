local tool = script.Parent
local damage = 20

tool.Activated:Connect(function()
	local character = tool.Parent
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

	if humanoidRootPart then
		for _, target in pairs(workspace:GetChildren()) do
			local humanoid = target:FindFirstChild("Humanoid")
			local root = target:FindFirstChild("HumanoidRootPart")

			if humanoid and root and (root.Position - humanoidRootPart.Position).magnitude < 6 then
				humanoid:TakeDamage(damage)
			end
		end
	end
end)
