local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)

self.CanBeFollowedBy = {"WhileAlso", "AndThen", "AndAlso"}

self.FunctionsAs = function(...)
	local Time, CompletionEvent = ...
	
	CompletionEvent:Connect(function(Delta, Traceback)
		error("Infinite yield expected, but task ended/n" .. Traceback)
	end)
	
	return FollowCommandChain(self.CanBeFollowedBy, CompletionEvent)
end

return self