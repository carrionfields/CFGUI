--Updated 8/7/2024
function guiHelp(helpselect)
  if helpselect == nil then
    helpselect = "menu"
  end
  
  if helpselect == '1' or helpselect == 'variables' then
  cecho(
    [[
<b><white>Variables<gray></b>

Syntax: <white>var<gray> to see and manage existing variables
	<white>var <steel_blue><variable name> <value>
	<white>@<variable name> <value> <gray>	

<white><b>Variables</b><gray> are special words that can be set to stand for another for use in <white><b>aliases</b><gray> (which are detailed in guihelp 3).
			
For example, you might set the variable <steel_blue>@food<gray> to 'chicken', or <steel_blue>@target<gray> to the name of the person you're trying to kill.  This makes your aliases more flexible and multifunctional.

Some of the variables are "default variables," which are recommended and used throughout your interface.  In the bar at the bottom of your screen, you will see six boxes labeled <white>Target, Action, Ally, Aid, Mainhand, <gray>and<white> Offhand.<gray> These are important variables to set, so they're listed in a place where you can always see them.  

On the right side of your screen, there is also an alias and variable window, which displays all of your set aliases and variables for your convenience.

If one of your variables refers to an item, we recommend that you use the in-game <white>KEYWORD<gray> command and copy all of the keywords, encased in single-quotes (example: 'whole chicken') into your variable to avoid accidentally using the wrong item.

]]
  )
elseif helpselect == '2' or helpselect == 'alias' then
  cecho(
    [[
<white><b>Aliases</b><gray>
  
<gray>Syntax: <white>alias<gray> to see and manage existing aliases
	<white>alias <pattern> <full command> <gray>to create or modify an alias
        <white>alias remove <pattern><gray> to delete a single alias
        <white>alias clear_yes<gray> to delete all aliases
        
	<gray>Special characters: <MediumSeaGreen>#<white> = <gray>Your input, <steel_blue>@<white> = <gray>Variable, <OrangeRed>;<white> = <gray>Split
        
<PaleGoldenrod>Aliases<gray> are like shortcuts that allow you to enter a complex command by just typing a few letters.  You can make your own using the <white>alias<gray> command, and you can even throw in <PaleGoldenrod>variables<gray> you create using the <white>var<gray> command.<gray>

Example 1:
<violet>alias heal co 'heal'
<white>Input:      <PaleGoldenrod>Output:
<white>heal     <OrangeRed>-> <PaleGoldenrod>co 'heal'
<white>heal pal <OrangeRed>-> <PaleGoldenrod>co 'heal' pal<reset>
--------------------------------------------------------------------
Example 2:
<violet>alias bt bash <steel_blue>@<pale_goldenrod>target
<gray>Set @target or any other variable with the <white>variable<gray> command (i.e. <white>var @target Joe<gray>). If you enter something else after 'bt', your command will replace the @target.

<white>Input:       <PaleGoldenrod>Output:
<white>bt        <OrangeRed>-> <PaleGoldenrod>bash Joe
<white>bt giant  <OrangeRed>-> <PaleGoldenrod>bash giant
--------------------------------------------------------------------
Example 3:
<violet>alias aa <steel_blue>@<pale_goldenrod>action <steel_blue>@<pale_goldenrod>target
<gray>(If we set <steel_blue>@<pale_goldenrod>action<gray> to "trip" using: <white>var @action trip<gray>)
<white>Input:       <PaleGoldenrod>Output:
<white>aa        <OrangeRed>-> <PaleGoldenrod>trip Joe
<white>aa giant  <OrangeRed>-> <PaleGoldenrod>trip giant
--------------------------------------------------------------------
Example 4:
<violet>alias gc get <MediumSeaGreen># <steel_blue>@<pale_goldenrod>container<OrangeRed>;<violet>eat <MediumSeaGreen>#
<gray>The # character translates into whatever you enter after the pattern. The ; character splits your alias into multiple commands. So, if @container = "knapsack"...
<white>Input:            <PaleGoldenrod>Output:
<white>gc bread       <OrangeRed>-> <PaleGoldenrod>get bread knapsack
                  eat bread
                  
<OrangeRed>Need more help?  Ask on ]]
  )
  cechoLink(
    "<DodgerBlue>The Carrion Fields Official Discord channel!\n",
    [[openURL("https://discord.gg/tK8Q5px"]],
    "Carrion Fields Official Discord",
    true
  )
elseif helpselect == '3' or helpselect == 'highlights' then
  cecho(
    [[
<white>Highlights<gray>

Syntax: <white>high <color> <text>
        <white>high<gray> to see and manage existing highlights

<PaleGoldenrod>Highlights <gray>change the color of certain words or phrases.  This can make it easier to see when important affects fall, or if you walk into a room with a "chest" in the description, for example.

For a full list of colors, use the <white>showcolors<gray> command.

]]
  )
  helpLinks()
elseif helpselect == '4' then
  cecho(
    [[
<white><b>The Friends and Enemies System</b><gray>
	
Syntax: <white>info
        <white>friend <name>
        <white>enemy <name>
        <white>neutral <name>
<gray>The Friends and Enemies System exists to help you keep track of characters you encounter. You can add <steel_blue>friends<gray>, <orange_red>enemies<gray>, or just <pale_goldenrod>neutral<gray> people to the list, and then fill in details about them as you learn more about them in-game.
This useful feature might help you remember an enemy's cabal, a warrior's specializations or a shapeshifter's forms. On the WHO and WHERE lists, names of friends will be tinted blue, while enemies' will be tinted red.

<orange_red>* <gray>We recommend that you begin by typing the <white>info<gray> command by itself.<orange_red> *
  
]]
  )
  helpLinks()
elseif helpselect == '5' then
  cecho(
    [[
<white><b>Gauges and the 'Setprompt' Command</b><gray>
  
Syntax: <white>setprompt<gray>
	<white>setprompt <arguments>

<gray>The gauges on the bottom console show your health, mana, movement and experience to next level based on the percentage of each. They gather those numbers from your prompt, from level-up messages, and from the SCORE command, when you use it.

<gray>The <white>setprompt<gray> command fixes your prompt to work with the GUI. Typing <white><b>setprompt</b><gray> by itself will set the default Carrion Fields prompt for you. 
			
You can also use the <white><b>setprompt</b><gray> command to make your own prompt using the format described in the in-game HELP PROMPT. Changing the prompt using the in-game command will

<OrangeRed><b>*</b><white> NOTE: It is now recommended to use the new, in-game <b>'mudletmode on'</b> command initially. Setprompt should still be used to modify your prompt.
]]
  )
  helpLinks()
elseif helpselect == '6' then
  cecho(
    [[
<white><b>Item Journal</b><gray>
  
<gray>Syntax: <white>journal <gray>to see a list of stored items
<gray>        <white>journal <item number> <gray>to view a stored item identification
<gray>        <white>journal remove <item number> <gray>to remove a stored item identification
<gray>        <white>journal <keyword> <gray>to search for a keyword, which could be any word in the stored item identification. Suggested keywords include item type, material, attack type, or affect type.

The Item Journal is an automatic feature that automatically logs and stores every item that you identify.

Because some methods of identification are imperfect (i.e. the lore skill), you may wish to use <white>journal remove <item number><gray> on an item before trying a more reliable method to correct any bad data.

]]
  )
  helpLinks()
elseif helpselect == '7' then
  cecho(
    [[
<white><b>Target Swapping</b><gray>
  
<gray>Syntax:<white> t1 <steel_blue><name><gray>
<white>t2 <steel_blue><name><gray> 
<white>t3 <steel_blue><name><gray>
<white>t4 <steel_blue><name><gray>	

<gray>Each of these commands adds an alternate target to buttons at the top of your interface. The <white>t1<gray> command sets a name that will become your <white>Target<gray> when you press the F1 key or click the button. The <white>t2<gray> command corresponds to your F2 key, and so on.

<gray>For example: Edward is your Target, and Jacob is your t1 alternate target. You press F1 or click on Jacob's name. Jacob then becomes your Target.
	
The <white>a5, a6, and a7<gray> commands can be used to add alternate actions to the buttons at the top of your interface.

See <white>guihelp 1<gray> for more on The Targeting System.
	
]]
  )
  helpLinks()
elseif helpselect == '8' then
  cecho(
    [[
<white><b>Logging and The Log Theater</b><gray>
Syntax:<white> autolog
       <white> log <steel_blue><filename>
       <white> searchlog <filename> <word or phrase>

<gray>Examples: <white>log cabalraid<gray>
<white>searchlog cabalraid is DEAD!!<gray>

The <white>autolog<gray> command toggles automatic logging of each and every session.  Those raw logs go into the log folder and are named using a date and time code.

<gray>You can also use the <white>log<gray> command to start a separate log. If you enter a filename that doesn't exist, it will create it as a text file in the log folder, which can be easily accessed by clicking the 'Logs' button at the top right corner of the screen. Use <white>log off<gray> to stop logging. The <white>searchlog<gray> command will find instances of a word or set of words in a log.

<gray>This quick logging function was contributed by a member of the Mudlet community. If you want to create more robust logs, you may use Mudlet's stock logging or replay features, located in the row of buttons to the right of the input prompt.

The Log Theater allows you to replay logs in real time! Use the interface to select a log file, hit play, and enjoy the show. (Long periods of inactivity in the log will be automatically edited.)

Logs must have timestamps in order to be replayable. To enable timestamps, click the "Settings" icon, or Options->Preferences, go to the General tab, and check the box labeled <b><white>"Add timestamps at the beginning of log lines"</b><gray>.
]]
  )
  helpLinks(
    "See the Mudlet forums for more on",
    "The Simple Logger",
    "https://forums.mudlet.org/viewtopic.php?t=1424",
    "Simple Logger Forum Topic"
  )
  
elseif helpselect == '9' then
  cecho(
    [[
<white><b>Combat Damage Colors</b><gray>
<gray>Syntax:<white> damcolor <on/off>
             <white> damcolor <incoming/outgoing> <color>

<gray>You can change the colors of damage affecting your character and damage that your character is doing to others.  This makes it easier for many players to immediately understand what is going on in the heat of battle.

Use the <white>showcolors<gray> command for a list of valid colors.

    ]]
    )
    helpLinks()    
elseif helpselect == '10' then
  cecho(
    [[
<white><b>Mapping</b><gray>

<gray>The Mudlet generic mapper works with Carrion Fields. We've added a few tweaks with this skin that should help your mapping efforts considerably. However, creating a map with the mapper will still require work on your end.

You can create your own maps of areas that you can save and use across multiple characters. However, we ask that you respect the rules and not share secrets with other players (unless done in-game) and especially do not share maps of Explore Areas.  Rule violations can result in character denials or even permanent bans.

To get started mapping, use the <white>map basics<gray> command.

<gray>Additionally, you can click the <white>World Map<gray> button to see an artistic rendering of the overworld, and the <white>Wiki Maps<gray> button to travel to an external website with unofficial, text-based maps that are updated often by the player community.
  
]]
  )
  helpLinks(
    "For detailed help, see",
    "The Mudlet Mapping Manual",
    "https://wiki.mudlet.org/w/Manual:Technical_Manual#Mapper",
    "The Mudlet Mapping Manual"
  )
  helpLinks()
elseif helpselect == '11' then
  cecho(
    [[
<white><b>Advanced Aliases & Scripting</b><gray>
  
<gray>We offer two ways to make aliases in Mudlet: our simple, command-line system, and the Mudlet way, which involves Lua scripting. If you decide to go the advanced route, knowing some basic programming helps. For the brave, visit wiki.mudlet.org for a helpful guide on creating aliases from scratch in Mudlet.

<orange_red>*<gray> To get started making simple ones, it's as easy as typing <white>alias<gray>. This is what we recommend for the vast majority of players.<orange_red>*<gray>

<orange_red>*<gray> Do not put your unique aliases in the CFGUI folder, or they will be lost when you update the Carrion Fields skin.<orange_red>*<gray>

]]
  )
  helpLinks()
  elseif helpselect == '12' then
    cecho(
	[[
<white><b>Affects and Affects Monitor</b><gray>

When you use the <white><b>affects</b><gray> command, the results will be recorded in the Affects Window and displayed alongside gauges to help you keep track of what is affecting your character. What is displayed in the Affects Window can be very helpful, but it is not always exact! Using the in-game <white><b>affects</b><gray> command will update the affects window and clear up any inconsistencies.

The Affects Monitor, meanwhile, also draws information from the <white><b>affects</b><gray> command. But instead of showing all affects, it watches for specific affects that are important to you. You can choose the affects to display by clicking on the individual affect in the Affects Window, or by using the <white><b>monitor</b><gray> command.

In addition to affects, you may create labels to better organize your Affects Monitor. For instance, you can create a label titled "Cabal Powers" and move your cabal-related affects beneath it. Or an "Keep Up" label for all abilities that should always be active. To delete a label, simply click it in the Affects Monitor.

]])
  elseif helpselect == '13' then
    cecho(
	[[				
<white><b>Fontsize</b><gray>

Most aspects of the interface can be resized. Use the <b><white>fontsize</b><gray> command to make sure text is legible on your screens. Smaller and low-resolution screens might require more adjustment.

Entering the <white><b>fontsize</b><gray> command will display a list of options.

]])
  elseif helpselect == '14' then
    cecho(
	[[				
<white><b>Keypad Keys</b><gray>

For those of you with keypads on the right-hand side of your keyboards, we have set up a scheme that should make walking around a bit easier:

<b><white>   7              8              9<reset>
  Flee          North            Up
			
<b><white>   4              5              6<reset>
  West           Look           East   
   
<b><white>   1              2              3<reset>
  Where          South          Down

Holding shift when you press any of the above directional keys will allow you to scan in the chosen direction. For example, shift + 8 would input <white><b>"scan north"<reset>. Other special keypad keys include:

<b><white>+<reset>: This will input your action and target variables. For example, if your action variable is <white><b>bash<reset> and your target variable is <white><b>Rahsael<reset> then it will input "<white><b>bash Rashael<reset>".

<b><white>.<reset>: This will input <white><b>"scan all"<reset>.

<b><white>0<reset>: This will input <white><b>"who pk"<reset>.

<b>Holding Ctrl and pressing keys will have different inputs, depending on your class.<reset>

For Warriors, Ctrl + direction will input "dash <direction>" and then your action. For example given the target and action variables above, Ctrl + 4 would input "dash west bash Rahsael".
For Shapeshifters, Ctrl + direction will input "run <direction>".
For Conjurers, Ctrl + direction will move your familiar in the chosen direction. / or Ctrl + / will release your familiar. Ctrl + + will order your familiar to murder your "target."
For Rangers, Ctrl + direction will attempt to creep in that direction. / or Ctrl + / will attempt to camouflage.

]])
elseif helpselect == '15' then
  cecho(
    [[
<white>Useful Utility Commands<gray>
  
<gray>Here is a list of commands that will help you to get the most out of this skin and client.
For more details, enter the command by itself.

 GUI COMMANDS:
 <steel_blue>* <white>buffer<gray>         - Sets the length of your scrollback buffer (default: 50,000 lines)
 <steel_blue>* <white>fontsize<gray>       - Sets fontsize of your console window. Type <white>fontsize<gray> alone for details.
 <steel_blue>* <DimGray>guisave<DimGray>        - Save the layout of your windows and tabs (Under Construction)
 <steel_blue>* <DimGray>guireset<DimGray>       - Reset your windows and tabs to default (Under Construction)
 <steel_blue>* <DimGray>guirestore<DimGray>     - Restore your gauges, buttons, channels and Main Menu windows (Under Construction)<reset>
 
 UTILITY COMMANDS:
 <steel_blue>* <white>autolog<gray>        - Toggle automatic logging of every session
 <steel_blue>* <white>showcolors<gray>     - See a list of all colors available for use in highlights and damcolor
 <steel_blue>* <white>queue<gray>          - Creates a list of commands to send; useful for notes/descs/roles/perform
 <steel_blue>* <white>delay<gray>          - Used with queue; sets time delay between sent commands
 <steel_blue>* <white>add<direction><gray> - After you look all, addeast/addwest etc. to quickly highlight exit descriptions
 
 EXTRAS:
 <steel_blue>* <white>famwindow<gray>      - For conjurers, switches familiar's views between main and familiar windows
 <steel_blue>* <white>damcolor<gray>       - Allows you to change the colors of incoming and outgoing damage
 <steel_blue>* <white>.<gray>              - Speedwalk. Ex: .2n3es would do 2 steps north, 3 east, then once south
]]
  )
  helpLinks()
  elseif helpselect == '0' then
  cecho(
    [[
<white>Troubleshooting<gray>
  
<gray>Many issues with the GUI can be fixed by entering SCORE or AFF in-game. On rare occasions, you may need to use the setprompt command again. If something seems hopelessly broken, try restarting Mudlet. If that fails, try creating a new profile and reloading this package. If you have further questions, comments or suggestions, please email imms@carrionfields.com and I'll do my best to help you out. If you're having trouble with an alias or some other type of customization, and copying/modifying an existing one isn't cutting it, check out Mudlet's wiki and forums - they do a great job and the community there is extremely supportive.
	
]])
  else
    cecho(
    [[
<reset>Enter <white>guihelp <number><reset> to learn about a feature.
			
    <dodger_blue>1<reset> - Variables
    <dodger_blue>2<reset> - Aliases
    <dodger_blue>3<reset> - Highlights

    <dodger_blue>5<reset> - Gauges and the 'Setprompt' Command
    <dodger_blue>4<reset> - The Friends and Enemies System
    <dodger_blue>6<reset> - Item Journal
    <dodger_blue>7<reset> - Target Swapping
    
    <dodger_blue>8<reset> - Logging and the Log Theater
    <dodger_blue>9<reset> - Combat Damage Colors
    <dodger_blue>10<reset> - Mapping
    
    <dodger_blue>11<reset> - Advanced Aliases & Scripting
    <dodger_blue>12<reset> - Affects and the Affects Monitor
    <dodger_blue>13<reset> - Fontsize
    <dodger_blue>14<reset> - Keypad Keys
			
						
    <dodger_blue>15<reset> - Useful Utility Commands - <OrangeRed>A Must-Read!
    
    <dodger_blue>0<reset> - Troubleshooting
  
<white>To get started quick:<gray> Type <white>alias<gray> to create aliases, <white>var<gray> to create variables.

]])

  end
end

function helpLinks(htext, hlinktext, hurl, hcaption)
  cecho("<steel_blue>Helpful Links:<gray>\n\n")
  cecho("<gray>Chat our friendly immortals and playerbase for help: ")
  cechoLink(
    "<dodger_blue>Carrion Fields Discord<gray>\n\n",
    [[openURL("https://discord.gg/tK8Q5px"]],
    "Carrion Fields Discord",
    true
  )
  cecho("<gray>For help with the client, visit ")
  cechoLink(
    "<dodger_blue>The Mudlet Manual\n\n",
    [[openWebPage("https://wiki.mudlet.org/w/Manual:Introduction")]],
    "The Mudlet Manual",
    true
  )
  if htext ~= nil and hlinktext ~= nil and hurl ~= nil and hcaption ~= nil then
    cecho("<gray>" .. htext .. " ")
    cechoLink(
      "<dodger_blue>" .. hlinktext .. "\n\n",
      [[openWebPage("https://]] .. hurl .. [[")]],
      hcaption,
      true
    )
  end
  cecho("<white>Enter 'guihelp' alone to return to the main help menu.\n\n")
end
