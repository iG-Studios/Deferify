local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)

self.CanBeFollowedBy = {"WhileAlso", "AndThen", "WhichShould"}

self.FunctionsAs = function(Method, ...)
	local CompletedEvent = Instance.new("BindableEvent")
	local Args = {...}
	local Traceback = debug.traceback()
	
	task.defer(function()
		local Start = os.clock()
		local Delta = nil
		
		local Success, ErrorMessage = pcall(function()
			Method(unpack(Args))
		end)
		
		Delta = os.clock() - Start
		CompletedEvent:Fire(Delta, Traceback, {Success, ErrorMessage})
		CompletedEvent:Destroy()
	end)
	
	return FollowCommandChain(self.CanBeFollowedBy, CompletedEvent.Event)
end

return self