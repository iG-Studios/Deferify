local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)

self.CanBeFollowedBy = {"WhileAlso", "AndThen", "AndAlso"}

self.FunctionsAs = function(...)
	local Time, Event = ...
	local Finished = false

	task.delay(Time, function()
		if not Finished then
			warn("A thread took longer than expacted, awaiting response\n" .. debug.traceback())
		end
	end)
	
	Event:Once(function(Delta, Traceback)
		Finished = true
		error("A run statement took longer than expected: " .. Traceback .. " (expected " .. Time .. " seconds, took " .. Delta .. " seconds)")
	end)
	
	return FollowCommandChain(self.CanBeFollowedBy, Event)
end

return self