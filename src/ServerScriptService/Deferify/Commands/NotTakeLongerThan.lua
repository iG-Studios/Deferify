local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)

self.CanBeFollowedBy = {"WhileAlso", "AndThen", "AndAlso"}

self.FunctionsAs = function(...)
	local Time, Event = ...
	
	Event:Connect(function(Delta, Traceback)
		if Delta > Time then
			error("A run statement took longer than expected: " .. Traceback .. " (expected " .. Time .. " seconds, took " .. Delta .. " seconds)")
		end
	end)
	
	return FollowCommandChain(self.CanBeFollowedBy, Event)
end

return self