-- Updated 8/6/2024

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

-- Disable/remove obsolete loader script
if exists("CF_Loader", "script") > 0 then
  disableScript("CF_loader")
  uninstallPackage("CF_loader")
end
if exists("CF-Loader", "script") > 0 then
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
    updateWindow()
  end
end
registerAnonymousEventHandler("sysDownloadDone", versionCheck)

-- Installation complete notice
function installComplete(_, package)
  if package == "CFGUI" then
    cecho("<OrangeRed><b>Installation complete!<reset>\n\n")
    cecho(
      "<grey>After logging in, you may need to use the <white><b>score</b><grey> and <white><b>setprompt</b><grey> command.\nSee <white><b>guihelp</b><grey> for more information.\n\n"
    )
  end
end
registerAnonymousEventHandler("sysInstall", installComplete)

--Create the window for Updates
function updateWindow()
  updateCon =
    updateCon or
    Adjustable.Container:new(
      {
        name = "updateCon",
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
  updateCon:show()
  UpdateVBox =
    Geyser.VBox:new({name = "UpdateVBox", x = 5, y = 5, width = "98%", height = "98%"}, updateCon)
  UpdateHBox = Geyser.HBox:new({name = "UpdateHBox"}, UpdateVBox)
  UpdateConsole =
    Geyser.MiniConsole:new(
      {name = 'UpdateConsole', v_stretch_factor = 5, autoWrap = true, scrollBar = false}, UpdateVBox
    )
  UpdateConsole:setFontSize(12)
  setBackgroundColor("UpdateConsole", 0, 0, 0, 0)
  if getAvailableFonts()["Cascadia Mono"] then
    setFont("UpdateConsole", "Cascadia Mono")
  end
  clearWindow("UpdateConsole")
  UpdateConsole:cecho(
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
  UpdateLabel:setClickCallback("updateCFGUI")
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
  CancelLabel:setClickCallback("closeUpdateCon")
  OptionsSpacerLabel2 =
    Geyser.Label:new({name = "OptionsSpacerLabel2", h_stretch_factor = 1}, OptionsHBox)
  OptionsSpacerLabel2:setStyleSheet(updateSpacerStyle)
end

function closeUpdateCon()
  clearWindow("UpdateConsole")
  updateCon:hide()
end

function updateCFGUI()
  uninstallPackage("CFGUI")
  saveProfile()
  UpdateConsole:cecho("\n\n<b><yellow>CLOSING MUDLET... REOPEN TO COMPLETE UPDATE.<reset>")
  tempTimer(5, [[ resetProfile() ]])
  tempTimer(6, [[echo("Please wait...")]])
  tempTimer(10, [[ installCFGUI() ]])
end

--Create the window for new installs
function installWindow()
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
    InstallLabel:setClickCallback("installCFGUI")
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

function installCFGUI()
  downloadFile(getMudletHomeDir().."/CFGUI.zip", "https://github.com/carrionfields/CFGUI/releases/latest/download/CFGUI.zip")
  installPackage(getMudletHomeDir().."/CFGUI.zip")
  closeInstallCon()
end

function noInstall()
  closeInstallCon()
  disableScript("cfLoader")
  resetProfile()
end
