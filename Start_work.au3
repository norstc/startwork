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

Local $sUrlBing="http://www.bing.com/"

;application under test

Local $sUrlPomp208User="http://192.168.1.208/pomp/user/tologin.do"
Local $sUrlPomp208Sso="http://192.168.1.208/pomp/sso/tologin.do"
Local $sUrlPomp204User="http://192.168.1.204/pomp/user/tologin.do"
Local $sUrlPompLabsUser="https://labs.sh-stt.com/pomp/user/login.do"
Local $sUrlPompResUser="https://117.136.190.188/user/tologin.do"

Local $sUrlMCMS200="https://192.168.1.200/mcms/user/login.do"
Local $sUrlMcms216="http://192.168.0.216:8080/user/login.do"

Local $sUrlEuopResUser="https://117.136.190.189:8443/user/tologin.do"
Local $sUrlEuopLabsUser="http://180.169.129.54:8888/euop/user/tologin.do"
Local $sUrlEuop181User="http://192.168.1.181:8080/euop/user/tologin.do"
Local $sUrlEuop175User="http://192.168.1.175:8099/euop/user/tologin.do"

Local $sUserName="zhangjh@sh-stt.com"
Local $sPhone="15800407048"


Opt("GUIOnEventMode",1)

Local $hMainGUI = GUICreate("Start work", 600,400)
GUISetOnEvent($GUI_EVENT_CLOSE,"CLOSEButton")
GUICtrlCreateLabel("Start the env", 30,10)
Local $iStartWorkButton = GUICtrlCreateButton("Start ENV", 30,40,100)
Local $iStartFirefoxDefaultButton = GUICtrlCreateButton("Firefox default", 30, 80, 100)
Local $iStartChromeDefaultButton = GUICtrlCreateButton("Chrome default", 30, 120, 100)
Local $iStartEdgeDefaultButton = GUICtrlCreateButton("Edge default", 30, 160, 100)



GUICtrlCreateLabel("Pomp", 200,10)
Local $iPomp208Button = GUICtrlCreateButton("Pomp208", 200, 40, 60)
Local $iPomp204Button = GUICtrlCreateButton("Pomp204", 200, 80, 60)
Local $iPompLabsButton = GUICtrlCreateButton("PompLabs", 200, 120, 60)
Local $iPompResButton = GUICtrlCreateButton("PompRes", 200, 160, 60)


GUICtrlCreateLabel("Euop", 300,10)
Local $iEuop181Button = GUICtrlCreateButton("Euop181",300, 40, 60)
Local $iEuop175Button = GUICtrlCreateButton("Euop175",300, 80, 60)
Local $iEuopLabsButton = GUICtrlCreateButton("EuopLabs", 300, 120, 60)
Local $iEuopResButton = GUICtrlCreateButton("EuopRes", 300, 160, 60)


GUICtrlSetOnEvent($iStartWorkButton,"Start_work")
GUICtrlSetOnEvent($iEuopResButton, "Euop_Res")
GUICtrlSetOnEvent($iEuopLabsButton,"Euop_Labs")
GUICtrlSetOnEvent($iEuop181Button, "Euop_181")
GUICtrlSetOnEvent($iEuop175Button, "Euop_175")

GUICtrlSetOnEvent($iPompResButton, "Pomp_Res")
GUICtrlSetOnEvent($iPompLabsButton,"Pomp_Labs")
GUICtrlSetOnEvent($iPomp208Button, "Pomp_208")
GUICtrlSetOnEvent($iPomp204Button,"Pomp_204")

GUICtrlSetOnEvent($iStartFirefoxDefaultButton, "Firefox_Default")
GUICtrlSetOnEvent($iStartChromeDefaultButton, "Chrome_Default")

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

Func Pomp_208()

   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_208 " & $sUrlPomp208User)

   Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")

EndFunc ;Pomp_208

Func Pomp_204()

   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_204 " & $sUrlPomp204User)

   Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")

EndFunc ;Pomp_204


Func Pomp_Labs()

   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_Labs " & $sUrlPompLabsUser)

   Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")

EndFunc ;Pomp_Labs

Func Pomp_Res()

   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_Res " & $sUrlPompResUser)

   Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")

EndFunc ;Pomp_Res


Func Euop_Res()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_Res " & $sUrlEuopResUser)

EndFunc ;Euop_Res


Func Euop_Labs()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_Labs " & $sUrlEuopLabsUser)

EndFunc ;Euop_Labs


Func Euop_181()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_181 " & $sUrlEuop181User)

EndFunc ;Euop_Labs

Func Euop_175()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_175 " & $sUrlEuop175User)

EndFunc ;Euop_Labs


Func Firefox_Default()
   Run($sFirefox & " -no-remote  " & $sUrlBing)
EndFunc;

Func Chrome_Default()
   Run($sChrome & " " & $sUrlBing)
EndFunc;

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
