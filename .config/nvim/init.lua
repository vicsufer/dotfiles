function loadrequire(module)
    local function requiref(module)
        require(module)
    end
    res = pcall(requiref, module)
end

require("vicsufer")
loadrequire("personal")
loadrequire("work")
