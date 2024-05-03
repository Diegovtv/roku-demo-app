sub Init()
    m.top.backgroundColor = "0x0B280C"
    m.top.backgroundUri = ""
    m.loadingIndicator = m.top.FindNode("loadingIndicator")
    InitScreenStack()
    ShowInformationScreen()
end sub

function OnkeyEvent(key as string, press as boolean) as boolean
    result = false
    if press
        if key = "back"
            numberOfScreens = m.screenStack.Count()
            if numberOfScreens > 1
                CloseScreen(invalid)
                result = true
            end if
        end if
    end if
    return result
end function
