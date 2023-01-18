local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)

self.CanBeFollowedBy = {"WhileAlso", "AndThen", "AndAlso"}

self.FunctionsAs = function(...)
	local Time, Event = ...
	
	Event:Connect(function(Delta, Traceback)
		error("Infinite yield expected, but task ended: " .. Traceback)
	end)
	
	return FollowCommandChain(self.CanBeFollowedBy, Event)
end

return self