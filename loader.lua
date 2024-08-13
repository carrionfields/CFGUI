-- Updated 8/13/2024
local installing = false

updateContainerStyle =
  [[
background-color: rgba(19,19,19,1); 
border-width: 1px;
border-radius: 5px;
border-style: outset;
border-color: rgba(255,215,0,.8);
]]
updateSpacerStyle = [[
background-color: #191919; 
border-width: 0px;
]]

-- Disable/remove obsolete loader scripts
if exists("CF_Loader", "script") > 0 then
  disableScript("CF_Loader")
  uninstallPackage("CF_Loader")
end
if exists("CF_loader", "script") > 0 then
  disableScript("CF_loader")
  uninstallPackage("CF_loader")
end
if exists("CF-loader", "script") > 0 then
  disableScript("CF-loader")
  uninstallPackage("CF-loader")
end

-- Downloads CFGUI if it is not installed, checking on profile startup
function promptUserInstallPkg()
  if exists("CFGUI", "script") > 0 then
    return
  else
    installWindow()
  end
  return
end
registerAnonymousEventHandler("sysLoadEvent", promptUserInstallPkg)


--Create the window for Updates
function updateBox()
  installCon =
    installCon or
    Adjustable.Container:new(
      {
        name = "installCon",
        x = "25%",
        y = "0%",
        width = "40%",
        height = "75%",
        adjLabelstyle = updateContainerStyle,
        buttonstyle = CF_button,
        buttonFontSize = 0,
        buttonsize = 0,
        titleText = "Carrion Fields Client Update Available",
        titleTxtColor = "LightGoldenrod",
        padding = 5,
        autoLoad = false,
        lockStyle = "border",
        locked = false,
      }
    )
  installCon:show()
  UpdateVBox =
    Geyser.VBox:new({name = "UpdateVBox", x = 5, y = 5, width = "98%", height = "98%"}, installCon)
  UpdateHBox = Geyser.HBox:new({name = "UpdateHBox"}, UpdateVBox)
  InstallConsole =
    Geyser.MiniConsole:new(
      {name = 'InstallConsole', v_stretch_factor = 5, autoWrap = true, scrollBar = false}, UpdateVBox
    )
  InstallConsole:setFontSize(12)
  setBackgroundColor("InstallConsole", 0, 0, 0, 0)
  if getAvailableFonts()["Cascadia Mono"] then
    setFont("InstallConsole", "Cascadia Mono")
  end
  clearWindow("InstallConsole")
  InstallConsole:cecho(
    "<white><b>A new version of the Carrion Fields client package is available!<reset>\n\nWe recommend updating for new features and bug fixes. <b>If you choose to update, Mudlet will close.</b> Installation will complete when you reopen Mudlet.\n\nYou can reopen this window anytime from the Main Menu."
  )
  OptionsHBox = Geyser.HBox:new({name = "OptionsHBox", v_stretch_factor = 1}, UpdateVBox)
  OptionsSpacerLabel1 =
    Geyser.Label:new({name = "OptionsSpacerLabel1", h_stretch_factor = 1}, OptionsHBox)
  OptionsSpacerLabel1:setStyleSheet(updateSpacerStyle)
  UpdateLabel = Geyser.Label:new({name = "UpdateLabel", h_stretch_factor = 1}, OptionsHBox)
  UpdateLabel:setStyleSheet(
    [[
QLabel{ 
  background-color: rgba(178,34,34,.3);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
	QLabel::hover{
	background-color: rgba(178,34,34,1);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
]]
  )
  UpdateLabel:setFontSize(14)
  UpdateLabel:setFgColor("White")
  UpdateLabel:echo("<center>Update Now!")
  UpdateLabel:setClickCallback("downloadCFGUI")
  CancelLabel = Geyser.Label:new({name = "CancelLabel", h_stretch_factor = 1}, OptionsHBox)
  CancelLabel:setStyleSheet(
    [[
QLabel{ 
  background-color: rgba(90,34,178,.3);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
	QLabel::hover{
	background-color: rgba(90,34,178,1);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
]]
  )
  CancelLabel:setFontSize(14)
  CancelLabel:setFgColor("White")
  CancelLabel:echo("<center>Remind Me Later")
  CancelLabel:setClickCallback("closeInstallCon")
  OptionsSpacerLabel2 =
    Geyser.Label:new({name = "OptionsSpacerLabel2", h_stretch_factor = 1}, OptionsHBox)
  OptionsSpacerLabel2:setStyleSheet(updateSpacerStyle)
end

--Create the window for new installs
function installWindow()
  if installing == true then return end
  if exists("CFGUI", "script") > 0 then
    return
  else
    installCon =
      installCon or
      Adjustable.Container:new(
        {
          name = "installCon",
          x = "25%",
          y = "0%",
          width = "40%",
          height = "75%",
          adjLabelstyle = updateContainerStyle,
          buttonstyle = CF_button,
          buttonFontSize = 0,
          buttonsize = 0,
          titleText = "Install Carrion Fields Client",
          titleTxtColor = "LightGoldenrod",
          padding = 5,
          autoLoad = false,
          lockStyle = "border",
          locked = false,
        }
      )
    installCon:show()
    InstallVBox =
      Geyser.VBox:new(
        {name = "InstallVBox", x = 5, y = 5, width = "98%", height = "98%"}, installCon
      )
    InstallHBox = Geyser.HBox:new({name = "UpdateHBox"}, InstallVBox)
    InstallConsole =
      Geyser.MiniConsole:new(
        {name = 'InstallConsole', v_stretch_factor = 5, autoWrap = true, scrollBar = false},
        InstallVBox
      )
    InstallConsole:setFontSize(12)
    setBackgroundColor("InstallConsole", 0, 0, 0, 0)
    if getAvailableFonts()["Cascadia Mono"] then
      setFont("InstallConsole", "Cascadia Mono")
    end
    clearWindow("InstallConsole")
    InstallConsole:cecho(
      [[
<white><b>Download the official Carrion Fields interface!<reset>

<grey>Enjoy features including:
<DodgerBlue>-<grey> Easy aliases, variables, and highlights
<DodgerBlue>-<grey> Health, mana, movement and experience gauges
<DodgerBlue>-<grey> Automatic logging, plus real-time replay
<DodgerBlue>-<grey> Monitors for magical, (un)holy, and physical conditions affecting your character
<DodgerBlue>-<grey> A journal that automatically records items you identify during your journeys
<DodgerBlue>-<grey> A separate console that saves and organizes your communications
<DodgerBlue>-<grey> An event calendar that tells you when the next in-game events and bonuses will take place

...and much more!
]]
    )
    InstallOptionsHBox =
      Geyser.HBox:new({name = "InstallOptionsHBox", v_stretch_factor = 1}, InstallVBox)
    InstallOptionsSpacerLabel1 =
      Geyser.Label:new(
        {name = "InstallOptionsSpacerLabel1", h_stretch_factor = 1}, InstallOptionsHBox
      )
    InstallOptionsSpacerLabel1:setStyleSheet(updateSpacerStyle)
    InstallLabel =
      Geyser.Label:new({name = "InstallLabel", h_stretch_factor = 1}, InstallOptionsHBox)
    InstallLabel:setStyleSheet(
      [[
QLabel{ 
  background-color: rgba(178,34,34,.3);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
	QLabel::hover{
	background-color: rgba(178,34,34,1);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
]]
    )
    InstallLabel:setFontSize(14)
    InstallLabel:setFgColor("White")
    InstallLabel:echo("<center>Install Now!")
    InstallLabel:setClickCallback("downloadCFGUI")
    LaterLabel = Geyser.Label:new({name = "LaterLabel", h_stretch_factor = 1}, InstallOptionsHBox)
    LaterLabel:setStyleSheet(
      [[
QLabel{ 
  background-color: rgba(90,34,178,.3);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
	QLabel::hover{
	background-color: rgba(90,34,178,1);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
]]
    )
    LaterLabel:setFontSize(14)
    LaterLabel:setFgColor("White")
    LaterLabel:echo("<center>Remind Me Later")
    LaterLabel:setClickCallback("closeInstallCon")
    NoInstallLabel =
      Geyser.Label:new({name = "NoInstallLabel", h_stretch_factor = 1}, InstallOptionsHBox)
    NoInstallLabel:setStyleSheet(
      [[
QLabel{ 
  background-color: rgba(34,34,34,.3);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
	QLabel::hover{
	background-color: rgba(90,90,90,1);
  border-style: outset;
  border-width: 1px;
  border-color: rgba(255,215,0,.8);
  border-radius: 5px;
  margin: 5px;
	font-family: 'Spectral', serif;
  qproperty-wordWrap: true;
	}
]]
    )
    NoInstallLabel:setFontSize(14)
    NoInstallLabel:setFgColor("White")
    NoInstallLabel:echo("<center>Do Not Ask Again")
    NoInstallLabel:setClickCallback("noInstall")
    InstallOptionsSpacerLabel2 =
      Geyser.Label:new(
        {name = "InstallOptionsSpacerLabel2", h_stretch_factor = 1}, InstallOptionsHBox
      )
    InstallOptionsSpacerLabel2:setStyleSheet(updateSpacerStyle)
  end
end

function closeInstallCon()
  clearWindow("InstallConsole")
  installCon:hide()
end

-- Attempt to download latest version of CFGUI, triggeered by click of "Install" or "Update" button
function downloadCFGUI()
  downloadFile(getMudletHomeDir().."/CFGUI.zip", "https://github.com/carrionfields/CFGUI/releases/latest/download/CFGUI.zip")
  InstallConsole:cecho("\n\n<reset><gray>Downloading latest version from https://github.com/carrionfields/CFGUI/releases/latest/download/CFGUI.zip\n")
end

-- Install, triggered by successful download of CFGUI.zip
function installCFGUI(_, filename)
  if not filename:find("CFGUI.zip", 1, true) then return end
  
  if exists("CFGUI", "script") > 0 then
    InstallConsole:cecho("<gray><b>Download complete!</b>\n\nUninstalling old version...\n")
    uninstallPackage("CFGUI")
    saveProfile()
    tempTimer(3, [[ resetProfile() ]])
    InstallConsole:cecho("<gray>Success.\n\n")
  end
  InstallConsole:cecho("Installing new version...\n\n")
  installing = true
  tempTimer(5, [[ installPackage(getMudletHomeDir().."/CFGUI.zip") ]])
end
registerAnonymousEventHandler("sysDownloadDone", installCFGUI)

-- Notifies user if CFGUI.zip fails to download
function CFGUIdownloadError(event, errorFound, localFilename, usedUrl)
  if not localFilename:find("CFGUI.zip", 1, true) then return end
  InstallConsole:cecho(errorFound)
  debugc("function downloadErrorEventHandler," .. errorFound)
  InstallConsole:cecho("\n<b><OrangeRed>Error: File download failed. Check your Internet connection.<reset>\n\n")
end
registerAnonymousEventHandler("sysDownloadError", CFGUIdownloadError)

-- Player declines to install
function noInstall()
  closeInstallCon()
  disableScript("cfLoader")
  resetProfile()
end

-- Installation complete notice
function installComplete(_, package)
  if package == "CFGUI" then
    closeInstallCon()
    cecho("<OrangeRed><b>Installation complete!<reset>\n\n")
    cecho(
      "<grey><b>IMPORTANT:</b> After logging in, you may need to use the <white><b>MUDLETMODE ON</b><grey> and <white><b>SETPROMPT</b><grey> commands to ensure your prompt and client function correctly.\n\nSee <white><b>GUIHELP</b><grey> for more information.\n\n"
    )
    update_ready = false
  end
end
registerAnonymousEventHandler("sysInstall", installComplete)

-- Checks the version number when version.txt is updated.
function versionCheck(a, filename)
  --  local filename = getMudletHomeDir().."/version.txt"
  --  local url = [[https://github.com/carrionfields/CFGUI/releases/latest/download/version.txt]]
  if not filename:find("version.txt", 1, true) then
    return
  end
  local f, s, versiontxt = io.open(filename)
  if f then
    gui_versiontxt = f:read("*l");
    obsolete_loader_version = f:read("*l");
    patchnotes = f:read("*a");
    io.close(f)
  end
  --Check GUI version
  if GUI_version == nil then
    installWindow()
    return
  end
  if gui_versiontxt == GUI_version then
    return
  else
    update_ready = true
    updateBox()
  end
end
registerAnonymousEventHandler("sysDownloadDone", versionCheck)
