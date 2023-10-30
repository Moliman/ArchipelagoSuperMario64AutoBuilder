@SET /p "id=Enter player name >>> "
@SET /p "ip=Enter room name (ex: archipelago:61349) >>> "

.\sm64ex\build\us_pc\sm64.us.f3dex2e.exe --sm64ap_name %id% --sm64ap_ip %ip%
