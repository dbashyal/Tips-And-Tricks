REM @author - Damodar Bashyal @ www.dltr.org
@echo off
FOR /F "delims=;" %%G IN ('ssh-agent') do (
	Echo.%%G | findstr /c:"echo ">nul && (
		REM SKIP THIS LINE
	) || (
		SET %%G
	)
)
ssh-add
