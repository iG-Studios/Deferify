local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)
local Run = require(script.Parent.Run)

self.CanBeFollowedBy = Run.CanBeFollowedBy

self.FunctionsAs = function(...)
	return Run.FunctionsAs(...)
end

return self