#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
;browser
Local $sChrome="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
Local $sFirefox="C:\Program Files (x86)\Mozilla Firefox\firefox.exe"

;work around
Local $sUrlInternetLogin="http://10.10.10.18:90/p/cdbdd4a09a64909694281aec503746fd/index.html?aGFvLjE2OXguY24v"
Local $sUrlGerit="http://review.sh-stt.com/login/q/status:open,n,z"
Local $sUrlJenkins="http://192.168.1.131:8080/ "
Local $sUrlRdms="http://192.168.0.224:8080/login.jsp"
Local $sUrlTestlink="http://192.168.1.247/testlink/login.php"
Local $sUrlMantis="http://192.168.1.247/mantisbt/"

;application under test

Local $sUrlPomp208User="http://192.168.1.208/pomp/user/tologin.do"
Local $sUrlPomp208Sso="http://192.168.1.208/pomp/sso/tologin.do"
Local $sUrlPomp204="http://192.168.1.204/pomp/login.do"
Local $sUrlMCMS200="https://192.168.1.200/mcms/user/login.do"
Local $sUrlMcms216="http://192.168.0.216:8080/user/login.do"

Opt("GUIOnEventMode",1)

Local $hMainGUI = GUICreate("Start work", 600,400)
GUISetOnEvent($GUI_EVENT_CLOSE,"CLOSEButton")
GUICtrlCreateLabel("Start the env", 30,10)
Local $iStartWorkButton = GUICtrlCreateButton("Start ENV", 30,40,60)
Local $iStartFirefoxDefultButton = GUICtrlCreateButton("Firefox default", 30, 80, 60)


GUICtrlCreateLabel("POMP", 300,10)
Local $iPOMP208Button = GUICtrlCreateButton("POMP208", 300, 40, 60)
Local $iPOMP204Button = GUICtrlCreateButton("POMP204", 300, 80, 60)
Local $iPOMPLABSButton = GUICtrlCreateButton("POMPLABS", 300, 120, 60)
Local $iPOMPRESButton = GUICtrlCreateButton("POMPRES", 300, 160, 60)


GUICtrlCreateLabel("EUOP", 400,10)
Local $iEUOP181Button = GUICtrlCreateButton("EUOP181",400, 40, 60)
Local $iEUOP175Button = GUICtrlCreateButton("EUOP175",400, 80, 60)
Local $iEUOPLABSButton = GUICtrlCreateButton("EUOPLABS", 400, 120, 60)
Local $iEUOPRESButton = GUICtrlCreateButton("EUOPRES", 400, 160, 60)


GUICtrlSetOnEvent($iStartWorkButton,"Start_work")
GUISetState(@SW_SHOW,$hMainGUI)

While 1
    Sleep(100)
WEnd

Func CLOSEButton()
    ;MsgBox($MB_OK, "GUI Event", "Closing")
    Exit
EndFunc ;==>CLOSEButton


Func Start_work()
    ;上班后启动工作环境
    ;登录联网许可，打开chrome，点击确定
    run($sChrome  & " " &    $sUrlGerit  & " " & $sUrlJenkins  & " " & $sUrlRdms  & " " & $sUrlTestlink  & " " & $sUrlMantis)
    Local $hWinChrome = WinWaitActive("[TITLE:Gerrit Code Review - Sign In - Google Chrome;INSTANCE:1]","");




    sleep(4*1000)
    send("{ENTER}")
    send("{ENTER}}")

    send("^2") ;jenkins
    sleep(4*1000)
    send("{ENTER}")

    send("^3") ;rdms
    sleep(4*1000)
    send("{ENTER}")
    mouseclick("left",1010,642,1); 确认登录 RDMS

    send("^4") ; Testlink
    sleep(4*1000)
    send("{ENTER}")

    send("^5") ; mantis
    sleep(4*1000)
    send("{ENTER}")

EndFunc ;==>Start_work

Func POMP_208()

   ;打开POMP-1310网站
   ;send("{ENTER}")
   run($sFirefox & " " & $sUrlPomp208User)

   Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")

EndFunc ;POMP_208


;
;
;
;
;
;
;
;
;
;
