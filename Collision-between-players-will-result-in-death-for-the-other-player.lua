local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local player = game.Players:GetPlayerFromCharacter(character)

-- キャラクターの全てのパーツを監視
for _, part in pairs(character:GetChildren()) do
	if part:IsA("BasePart") then
		part.Touched:Connect(function(hit)
			local hitCharacter = hit.Parent
			local hitHumanoid = hitCharacter:FindFirstChild("Humanoid")
			local hitPlayer = game.Players:GetPlayerFromCharacter(hitCharacter)

			-- ぶつかった相手がプレイヤーで、自分ではない場合のみ
			if hitHumanoid and hitPlayer and hitPlayer ~= player then
				hitHumanoid.Health = 0 -- 相手を倒す！
			end
		end)
	end
end
