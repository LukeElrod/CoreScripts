-- Function to check and handle Wraithguard equipment
local function handleWraithguardEquipment(eventStatus, pid)
    local player = Players[pid]

    for index = 0, tes3mp.GetEquipmentSize() - 1 do
        local currentItem = player.data.equipment[index]

        if currentItem ~= nil then
            if currentItem.refId == 'wraithguard' or currentItem.refId == 'wraithguard_jury_rig' then
                contentFixer.UnequipDeadlyItems(pid)

                if tes3mp.SetUsedItem(pid, "wraithguard") then
                    tes3mp.LogMessage(enumerations.log.INFO, "wraithguard found")
                else
                    tes3mp.LogMessage(enumerations.log.INFO, "wraithguard missing")
                end

                if tes3mp.SetUsedItem(pid, "wraithguard_jury_rig") then
                    tes3mp.LogMessage(enumerations.log.INFO, "wraithguard_jury_rig found")
                else
                    tes3mp.LogMessage(enumerations.log.INFO, "wraithguard_jury_rig missing")
                end

                eventHandler.OnPlayerItemUse(pid)
                tes3mp.LogMessage(enumerations.log.INFO, "Reset Wraithguard for player: " .. pid)
            end
        end
    end
end

customEventHooks.registerHandler("OnPlayerFinishLogin", function(eventStatus, pid)
    handleWraithguardEquipment(eventStatus, pid)
end)
