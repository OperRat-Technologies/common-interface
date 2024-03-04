local term = require("term")
local component = require("component")
local gpu = component.gpu

---Class for holding the screen interface
---@param rows number
---@param cols number
---@param bgColor number
---@param fgColor number
function CIScreen(rows, cols, bgColor, fgColor, ...)
    local self = {
        rows = rows,
        cols = cols,
        bgColor = bgColor,
        fgColor = fgColor,
        background = {...},
        params = {}
    }

    function self.assertScreenSize()
        gpu.setForeground(self.fgColor)
        gpu.setBackground(self.bgColor)
        gpu.setResolution(self.cols, self.rows)
        gpu.setViewport(self.cols, self.rows)
    end

    ---Prints the background in a non-wrapping way
    function self.printBackground()
        self.assertScreenSize()
        for i = 1, #self.background do
            term.setCursor(1, i)
            term.write(self.background[i], false)
        end
    end

    ---Registers a new Param to the screen
    ---@param param any
    ---@return any
    function self.registerParam(param)
        table.insert(self.params, param)
        return param
    end

    ---Clears the screen for all registered params
    function self.clearAllParams()
        for i = 1, #self.params do
            self.params[i].clear()
        end
    end

    return self
end

return {
    Screen = CIScreen
}