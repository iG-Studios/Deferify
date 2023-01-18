local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)

self.CanBeFollowedBy = {"WhileAlso", "AndThen"}

self.FunctionsAs = function(Method, Event)
	Event:Connect(Method)
	
	return FollowCommandChain(self.CanBeFollowedBy)
end

return self