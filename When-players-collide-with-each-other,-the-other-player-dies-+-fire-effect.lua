local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local player = game.Players:GetPlayerFromCharacter(character)

-- キャラクターのすべてのパーツを監視
for _, part in pairs(character:GetChildren()) do
	if part:IsA("BasePart") then
		part.Touched:Connect(function(hit)
			local hitCharacter = hit.Parent
			local hitHumanoid = hitCharacter:FindFirstChild("Humanoid")
			local hitPlayer = game.Players:GetPlayerFromCharacter(hitCharacter)

			-- 相手がプレイヤーで、自分ではない場合
			if hitHumanoid and hitPlayer and hitPlayer ~= player then
				-- 🔥 炎エフェクトを作成
				local fire = Instance.new("Fire")
				fire.Heat = 10        -- 熱さ（強さ）
				fire.Size = 8         -- 炎の大きさ
				fire.Parent = hitCharacter:FindFirstChild("HumanoidRootPart") or hitCharacter.PrimaryPart

				-- 💀 相手を倒す
				hitHumanoid.Health = 0
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://1847183830"  -- 炎の音（Roblox内の効果音）
        sound.Volume = 1
        sound.Parent = hitCharacter:FindFirstChild("HumanoidRootPart") or hitCharacter.PrimaryPart
        sound:Play()
        game.Debris:AddItem(sound, 3)


				-- 🔥 少しして炎を消す（3秒後）
				game.Debris:AddItem(fire, 3)
			end
		end)
	end
end
