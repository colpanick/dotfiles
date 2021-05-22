#!/usr/bin/lua5.3

local M = {}

channel = "Capture"

function M.get_mic_state()

    mic_status = io.popen("amixer get " .. channel):read("*a")
    mic_state = string.match(mic_status, "%[(o..?)]")
    return mic_state
end

function M.toggle_mic()
    output = io.popen("amixer set " .. channel .. " toggle"):read("*a")
    return string.match(output, "%[(o..?)]")
end

print(M.toggle_mic())

return M
    

