sub Init()
    ' App info
    ai = CreateObject("roAppInfo")

    ' Device info
    di = CreateObject("roDeviceInfo")

    m.dialog = CreateObject("roSGNode", "Dialog")

    ' Find nodes here
    m.presentationLabel = m.top.FindNode("presentationLabel")
    ' model nodes
    m.modelNameLabel = m.top.FindNode("modelNameLabel")
    m.modelTypeLabel = m.top.FindNode("modelTypeLabel")
    m.modelDisplayModeLabel = m.top.FindNode("modelDisplayModeLabel")
    m.deviceConnectionLabel = m.top.FindNode("deviceConnectionLabel")
    m.deviceResolutionLabel = m.top.FindNode("deviceResolutionLabel")
    m.deviceAspectRatioLabel = m.top.FindNode("deviceAspectRatioLabel")
    ' app nodes
    m.appInfoNameLabel = m.top.FindNode("appInfoNameLabel")
    m.appInfoIdLabel = m.top.FindNode("appInfoIdLabel")
    m.appInfoVersionLabel = m.top.FindNode("appInfoVersionLabel")
    m.appInfoIsDevLabel = m.top.FindNode("appInfoIsDevLabel")
    m.appInfoDevIdLabel = m.top.FindNode("appInfoDevIdLabel")
    ' image nodes
    m.poster = m.top.FindNode("poster")
    ' button nodes
    m.buttonGroup = m.top.findNode("buttonGroupSample")

    m.buttonGroup.buttons = ["OK", "Cancel"]

    m.buttonGroup.ObserveField("buttonSelected", "onButtonSelected")

    ' Assign poster image
    m.poster.uri = "pkg:/images/splash-screen-velope_fhd.png"

    ' Assign the labels text
    ' app text labels
    m.presentationLabel.text = ai.GetTitle()
    m.appInfoNameLabel.text = "Name: " + ai.GetTitle()
    m.appInfoIdLabel.text = "ID: " + ai.GetID()
    m.appInfoVersionLabel.text = "Version: " + ai.GetVersion()
    if ai.IsDev()
        m.appInfoIsDevLabel.text = "Dev mode: true"
        m.appInfoDevIdLabel.text = "Dev ID: " + ai.GetDevID()
    else
        m.appInfoIsDevLabel.text = "Dev mode: false"
        m.appInfoDevIdLabel.text = "Dev ID: N/A"
    end if
    ' device text labels
    m.modelNameLabel.text = "Device: Roku " + di.GetModelDisplayName() + " - " + di.GetModel()
    m.modelTypeLabel.text = "Device type: " + di.GetModelType()
    if di.GetInternetStatus()
        m.deviceConnectionLabel.text = "Internet: Connected - " + di.GetConnectionType()
    else
        m.deviceConnectionLabel.text = "Internet: Disconnected"
    end if
    m.deviceResolutionLabel.text = "Device Resolution:" + di.GetUIResolution().name + " - " + di.GetUIResolution().width.ToStr() + "x" + di.GetUIResolution().height.ToStr()
    m.deviceAspectRatioLabel.text = "Aspect Ratio: " + di.GetDisplayAspectRatio()

    m.top.setFocus(true)
end sub

sub showdialog()
    m.dialog.title = "Sample Dialog"
    m.dialog.optionsDialog = true
    m.dialog.message = "Press * to dismiss"
    m.dialog.SetFocus(true)
    m.top.appendChild(m.dialog)
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press then
        if key = "options"
            m.top.removeChild(m.dialog)
        end if
    end if

    return false
end function

function onButtonSelected()
    index = m.buttonGroup.buttonSelected
    if index = 0
        print("You have pressed OK!")
        showdialog()
    else if index = 1
        print("You have pressed Cancel!")
    end if
end function