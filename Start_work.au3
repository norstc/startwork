#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <MsgBoxConstants.au3>
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


;上班后启动工作环境
;登录联网许可，打开chrome，点击确定
run($sChrome  & " " &  $sUrlInternetLogin  & " " &  $sUrlGerit  & " " & $sUrlJenkins  & " " & $sUrlRdms  & " " & $sUrlTestlink  & " " & $sUrlMantis)
Local $hWinChrome = WinWaitActive("[TITLE:用户认证系统 - Google Chrome;CLASS:Chrome_WidgetWin_1;INSTANCE:1]","");

sleep(5*1000)
MouseClick("left",1009,423,1) ;确认登录安全上网按钮

send("^2") ;gerrit
sleep(4*1000)
send("{ENTER}")
send("{ENTER}}")

send("^3") ;jenkins
sleep(4*1000)
send("{ENTER}")

send("^4") ;rdms
sleep(4*1000)
send("{ENTER}")
mouseclick("left",1010,642,1); 确认登录 RDMS

send("^5") ; Testlink
sleep(4*1000)
send("{ENTER}")

send("^6") ; mantis
sleep(4*1000)
send("{ENTER}")

;打开POMP-1310网站
;send("{ENTER}")
run($sFirefox & " " & $sUrlPomp208User)

Local $hWinFirefox = WinWaitActive("[TITLE:管理员登录 - Mozilla Firefox;CLASS:MozillaWindowClass]","")
MsgBox($MB_SYSTEMMODAL, "LET'S START WORK", "CHECK THE UUT")




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
