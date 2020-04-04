Autopilot1 = find_dataref("sim/cockpit2/autopilot/autopilot_on")
Autopilot2 = find_dataref("sim/cockpit2/autopilot/autopilot2_on")
Flight_director1 = find_dataref("sim/cockpit2/autopilot/flight_director_mode")
Flight_director2 = find_dataref("sim/cockpit2/autopilot/flight_director2_mode")
Flight_director_master = find_dataref("sim/cockpit2/autopilot/master_flight_director")

--custom dataref handlers
function A2050_ECAM_DRhandler()

end
--custom datarefs(read and write)
ECAM_page_id = create_dataref("A2050/cockpit/display/ECAM_page_id","number",A2050_ECAM_DRhandler)

--custom command handlers
function A2050_ECAM_page_1_CMDhandler()
    ECAM_page_id = 0
end

function A2050_ECAM_page_2_CMDhandler()
    ECAM_page_id = 1
end

function A2050_ECAM_page_3_CMDhandler()
    ECAM_page_id = 2
end

function A2050_ECAM_page_4_CMDhandler()
    ECAM_page_id = 3
end

function A2050_ECAM_page_5_CMDhandler()
    ECAM_page_id = 4
end

function A2050_ECAM_page_toggle_CMDhandler(phase, duration)
    if phase == 0 then
        if ECAM_page_id < 5 then
            ECAM_page_id = ECAM_page_id + 1
        elseif ECAM_page_id == 5 then
            ECAM_page_id = 0
        end
    end
end
--custom commands
ECAM_page_1 = create_command("A2050/cockpit/display/ECAM_page_1", "ECAM page 1", A2050_ECAM_page_1_CMDhandler)
ECAM_page_2 = create_command("A2050/cockpit/display/ECAM_page_2", "ECAM page 2", A2050_ECAM_page_2_CMDhandler)
ECAM_page_3 = create_command("A2050/cockpit/display/ECAM_page_3", "ECAM page 3", A2050_ECAM_page_3_CMDhandler)
ECAM_page_4 = create_command("A2050/cockpit/display/ECAM_page_4", "ECAM page 4", A2050_ECAM_page_4_CMDhandler)
ECAM_page_5 = create_command("A2050/cockpit/display/ECAM_page_5", "ECAM page 5", A2050_ECAM_page_5_CMDhandler)
ECAM_page_toggle = create_command("A2050/cockpit/display/ECAM_page_toggle", "ECAM page toggle", A2050_ECAM_page_toggle_CMDhandler)

function flight_start()
    --engine_toga_1 = 1
    --engine_toga_2 = 1
end

function after_physics()
    if Flight_director1 == Flight_director2 then
        Flight_director_master = 2
    elseif Flight_director1 ~= Flight_director2 then
        Flight_director_master = 0
    end
end