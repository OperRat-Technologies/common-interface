local term = require("term")
local component = require("component")
local gpu = component.gpu

---Class for controlling a printable parameter inside the interface
---@param row number
---@param col number
---@param length number
---@param format string
function CIParam(row, col, length, format)
    local self = {
        row = row,
        col = col,
        length = length,
        format = format
    }

    ---Sets the cursor to the start of the param on the screen
    function self.setCursor()
        term.setCursor(col, row)
    end
    
    ---Prints the format string with the supplied arguments
    ---@param ... any
    function self.print(...)
        self.setCursor()
        term.write(string.format(self.format, ...), false)
    end

    ---Clears the output string
    function self.clear()
        gpu.fill(self.col, self.row, self.length, 1, " ")
    end

    return self
end

return {
    Param = CIParam
}