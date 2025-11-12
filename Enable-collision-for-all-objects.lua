-- EnableCollision.lua
-- すべてのオブジェクトの当たり判定を有効にするスクリプト
-- Robloxでrequire()またはコピーして使えます

local module = {}

function module.EnableAllCollisions(workspaceRef)
	local workspaceTarget = workspaceRef or workspace
	print("🔧 当たり判定を有効化しています...")

	local function enableCollisionInDescendants(parent)
		for _, obj in ipairs(parent:GetDescendants()) do
			if obj:IsA("BasePart") then
				obj.CanCollide = true
			end
		end
	end

	enableCollisionInDescendants(workspaceTarget)

	workspaceTarget.DescendantAdded:Connect(function(obj)
		if obj:IsA("BasePart") then
			obj.CanCollide = true
		end
	end)

	print("✅ すべての当たり判定を有効化しました！")
end

return module
