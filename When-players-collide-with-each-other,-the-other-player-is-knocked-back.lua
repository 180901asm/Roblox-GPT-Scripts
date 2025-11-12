local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local player = game.Players:GetPlayerFromCharacter(character)

-- キャラクターのパーツを監視
for _, part in pairs(character:GetChildren()) do
	if part:IsA("BasePart") then
		part.Touched:Connect(function(hit)
			local hitCharacter = hit.Parent
			local hitHumanoid = hitCharacter:FindFirstChild("Humanoid")
			local hitPlayer = game.Players:GetPlayerFromCharacter(hitCharacter)

			-- 相手がプレイヤーで自分じゃない場合のみ
			if hitHumanoid and hitPlayer and hitPlayer ~= player then
				local root = hitCharacter:FindFirstChild("HumanoidRootPart")
				local myRoot = character:FindFirstChild("HumanoidRootPart")

				if root and myRoot then
					-- 吹っ飛ばす方向（自分から相手へ）
					local direction = (root.Position - myRoot.Position).Unit
          local explosion = Instance.new("Explosion")
          explosion.Position = root.Position
          explosion.BlastPressure = 0
          explosion.BlastRadius = 0
          explosion.Parent = workspace

					
					-- 💨 ノックバック用の力を作成
					local knockback = Instance.new("BodyVelocity")
					knockback.Velocity = direction * 80 + Vector3.new(0, 40, 0) -- ←勢い＆上方向
					knockback.MaxForce = Vector3.new(4000, 4000, 4000)
					knockback.P = 1250
					knockback.Parent = root

					-- 効果は0.3秒だけ
					game.Debris:AddItem(knockback, 0.3)

					-- 💥 追加演出：軽くダメージ（不要なら削除OK）
					hitHumanoid:TakeDamage(10)
				end
			end
		end)
	end
end
