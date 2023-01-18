local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)

self.CanBeFollowedBy = {"WhileAlso", "AndThen", "AndAlso"}

self.FunctionsAs = function(...)
	local _, Event = ...
	
	Event:Connect(function(Delta, Traceback, ErrorStatus)
		local Success, ErrorMessage = unpack(ErrorStatus)
		
		if not Success then
			error("Expected method to throw but it did not: " .. ErrorMessage .. Traceback)
		end
	end)
	
	return FollowCommandChain(self.CanBeFollowedBy, Event)
end

return self