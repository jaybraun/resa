      SUBROUTINE DISP_ERR(ISTAT,SERVICE)
      IMPLICIT NONE
      INTEGER*4 SYSOUT
      INTEGER*4 ISTAT,ILEN
      CHARACTER *(*) SERVICE
      CHARACTER *100 MSG
      MSG =''
      IF(.NOT.(ISTAT.GE.0))GOTO 23000
      CALL SYS$GETMSG (%VAL(ISTAT),ILEN,MSG,%VAL(15),)
      WRITE (6,8000) SERVICE,ISTAT,MSG(1:ILEN)
8000  FORMAT (' *** ',A10,' status = ',Z10,' hex',2X,A)
      GOTO 23001
23000 CONTINUE
      WRITE (6,8900) SERVICE,ISTAT
8900  FORMAT ('*** ',A10,' invalid error = ',Z10,' hex')
23001 CONTINUE
      RETURN
      END
