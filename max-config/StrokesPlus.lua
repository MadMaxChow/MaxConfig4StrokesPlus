--Enter any Lua script that you'd like always executed when StrokesPlus loads, 
--or when you click Reload Config and Lua Engine.

function sp_init()
	-- code in this function is fired once when the Lua engine is reloaded
    -- which occurs when S+ is started, Ok/Apply is clicked in the settings window
    -- or when Reload Config and Lua Engine is clicked from the tray menu

end

function sp_before_action(gnm, gsx, gsy, gex, gey, gwd, gapp, gact)
	-- this code is fired before each action (excluding hotkey actions)

    acActivateWindow(aGetAncestor(acGetWindowByPoint(gsx, gsy), GA_ROOT), 0, 0)
end

    aliencore = alien.core
    user32 = aliencore.load("user32.dll")

    gGetAncestor = user32.GetAncestor
    gGetAncestor:types{ ret = 'long', abi = 'stdcall', 'long', 'uint'}
    GA_PARENT = 1
    GA_ROOT = 2
    GA_ROOTOWNER = 3

function aGetAncestor(iWnd, iFlags)
    return gGetAncestor(iWnd, iFlags)
end 

function sp_after_action(gnm, gsx, gsy, gex, gey, gwd, gapp, gact)
	-- this code is executed after each action (excluding hotkey actions)
    -- this function is not enabled by default, you must check the following setting
    -- in the Preferences tab: Allow After Action Script*
end

function sp_middle_mouse_down()
	-- this code is executed whenever you press the middle mouse button down
	-- this function is not enabled by default, you must check the following setting
    -- in the Preferences tab: Allow Middle Click Script*
end

function sp_after_release()
	-- this code is executed whenever you release the stroke button
	-- this function is not enabled by default, you must check the following setting
    -- in the Preferences tab: Allow After Release Script*
end 