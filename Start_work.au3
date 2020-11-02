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
Local $sOpera="C:\Users\Administrator\AppData\Local\Programs\Opera\launcher.exe"
Local $sEdge_Shortcut=""

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
Local $iStartOperaDefaultButton = GUICtrlCreateButton("Opera default", 30,200, 100)
Local $iStartIeDefaultButton = GUICtrlCreateButton("Ie default", 30, 240, 100)



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

;buttons with functions
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
GUICtrlSetOnEvent($iStartOperaDefaultButton,"Opera_Default");
GUICtrlSetOnEvent($iStartEdgeDefaultButton, "Edge_Default")
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



   send("^1");gerit
    sleep(1*1000)


    send("^2") ;jenkins
    sleep(1*1000)


    send("^3") ;rdms
    sleep(1*1000)

    ;mouseclick("left",1010,642,1); 确认登录 RDMS

    send("^4") ; Testlink
    sleep(1*1000)


    send("^5") ; mantis
    sleep(1*1000)


EndFunc ;==>Start_work

Func Pomp_208()

   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_208 " & $sUrlPomp208User)

   Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")
   Local $hWin = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox]","")
   Sleep(1000)
   Send("{TAB}")
   Send($sUserName)
   Send("{TAB}")
   Send($sPhone)
   Send("{TAB}")
   Send("1")


EndFunc ;Pomp_208

Func Pomp_204()
   Local $sUserNamePomp204 = 'test_jt_2@sh.com';
   Local $sPhonePomp204="13312345678"

   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_204 " & $sUrlPomp204User)

   Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")
   Local $hWin = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox]","")
   Sleep(1000)
   Send("{TAB}")
   Send($sUserNamePomp204)
   Send("{TAB}")
   Send($sPhonePomp204)
   Send("{TAB}")
   Send("1")


EndFunc ;Pomp_204


Func Pomp_Labs()
   Local $sUserNamePompLabs = "zhangjunhua@sh";
   Local $sPhonePompLabs = "15800407048";
   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_Labs " & $sUrlPompLabsUser)

   Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")
   Sleep(1000)
   Send("{TAB}")
   Send($sUserNamePompLabs)
   Send("{TAB}")
   Send($sPhonePompLabs)
   Send("{TAB}")
   Send("1")

EndFunc ;Pomp_Labs

Func Pomp_Res()
   Local $sUserNamePompRes="15261061786"
   Local $sPhonePompRes="15800407048"
   run($sFirefox & " -no-remote -profile firefox_profiles/Pomp_Res " & $sUrlPompResUser)

   Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")
   Sleep(1000)
   Send("{TAB}")
   Send($sUserNamePompRes)
   Send("{TAB}")
   Send($sPhonePompRes)
   Send("{TAB}")
   Send("1")

EndFunc ;Pomp_Res


Func Euop_Res()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_Res " & $sUrlEuopResUser)
   Local $hWin = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox]","")
   Sleep(1000)
   Send("{TAB}")
   Send($sUserName)
   Send("{TAB}")
   Send($sPhone)
   Send("{TAB}")
   Send("1")


EndFunc ;Euop_Res


Func Euop_Labs()
   Local $sUserNameEuopLabs='zhangjunhua@sh.com'
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_Labs " & $sUrlEuopLabsUser)
   Local $hWin = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox]","")
   Sleep(1000)
   Send("{TAB}")
   Send($sUserNameEuopLabs)
   Send("{TAB}")
   Send($sPhone)
   Send("{TAB}")
   Send("1")

EndFunc ;Euop_Labs


Func Euop_181()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_181 " & $sUrlEuop181User)
   Local $hWin = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox]","")
   Sleep(1000)
   Send("{TAB}")
   Send($sUserName)
   Send("{TAB}")
   Send($sPhone)
   Send("{TAB}")
   Send("1")




EndFunc ;Euop_Labs

Func Euop_175()
   Run($sFirefox & " -no-remote -profile firefox_profiles/Euop_175 " & $sUrlEuop175User)
   Local $hWin = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox]","")
   Sleep(1000)
   Send("{TAB}")
   Send($sUserName)
   Send("{TAB}")
   Send($sPhone)
   Send("{TAB}")
   Send("1")


EndFunc ;Euop_Labs


Func Firefox_Default()
   Run($sFirefox & " -no-remote  " & $sUrlBing)
EndFunc;

Func Chrome_Default()
   Run($sChrome & " " & $sUrlBing)
EndFunc;

Func Opera_Default()
   Run($sOpera & " " & $sUrlBing)
EndFunc;


Func Edge_Default()
   Local $edge_test = FileExists(@WindowsDir & '\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe')
   If $edge_test = 1 Then
	  Local $edge = RunWait('explorer.exe shell:AppsFolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge')
   EndIf
EndFunc;

Func Ie_Default()
   Run($sIe & " " & $sUrlBing)
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
