local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)

self.CanBeFollowedBy = {"NotTakeLongerThan", "InfinitelyYield", "Throw", "NotThrow"}

self.FunctionsAs = function(...)
	return FollowCommandChain(self.CanBeFollowedBy, ({...})[2])
end

return self