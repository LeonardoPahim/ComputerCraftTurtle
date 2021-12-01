local monitor
function findMonitor()
    for i, v in pairs(rs.getSides()) do
        if peripheral.getType(v) == "monitor" then
            monitor = peripheral.wrap(v)
            return
        end
    end
    error("No monitor connected")
end

rednet.open('top')
findMonitor()
monitor.setTextScale(1)

while true do
    local id, msg, dist = rednet.receive()
    if msg == 'Done' then
        monitor.write("Miner 1 is done!")
        print("Press a key to reset")
        os.pullEvent('key')
        monitor.clear()
        monitor.setCursorPos(1,1)
    end
end
