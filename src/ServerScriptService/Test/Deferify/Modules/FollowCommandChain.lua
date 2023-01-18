local Commands = script:FindFirstAncestorOfClass("ModuleScript").Commands

return function(Dependencies, ...)
	local NextChain = {}
	local Args = {...}
	
	for _, Name in Dependencies do
		NextChain[Name] = function(...)
			return require(Commands:FindFirstChild(Name)).FunctionsAs(..., unpack(Args))
		end
	end
	
	return setmetatable({}, {
		__index = function(_, Key)
			if NextChain[Key] then
				return NextChain[Key]
			elseif Commands:FindFirstChild(Key) then
				error("Attempted to call a method that cannot be followed from the previous: " .. Key)
			else
				error("Attempted to call a method that does not exist: " .. Key)
			end
		end,
	})
end