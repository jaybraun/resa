      SUBROUTINE FGTJFN (JFN,SOURCE,ITYPE,IERROR,*)
      IMPLICIT NONE
      INTEGER JFN,ITYPE,IERROR,OPEN_,K
      LOGICAL*1 SOURCE(100),WORK(100)
      EXTERNAL SCOPY
      LOGICAL*1 ERROR_2(46)
      LOGICAL*1 ERROR_3(32)
      DATA ERROR_2(1)/87/,ERROR_2(2)/45/,ERROR_2(3)/74/,ERROR_2(4)/70/,E
     *RROR_2(5)/78/,ERROR_2(6)/82/,ERROR_2(7)/84/,ERROR_2(8)/78/,ERROR_2
     *(9)/83/,ERROR_2(10)/44/,ERROR_2(11)/32/,ERROR_2(12)/32/,ERROR_2(13
     *)/70/,ERROR_2(14)/71/,ERROR_2(15)/84/,ERROR_2(16)/74/,ERROR_2(17)/
     *70/,ERROR_2(18)/78/,ERROR_2(19)/32/,ERROR_2(20)/100/,ERROR_2(21)/1
     *11/,ERROR_2(22)/101/,ERROR_2(23)/115/,ERROR_2(24)/32/,ERROR_2(25)/
     *110/,ERROR_2(26)/111/,ERROR_2(27)/116/,ERROR_2(28)/32/,ERROR_2(29)
     */115/,ERROR_2(30)/117/,ERROR_2(31)/112/,ERROR_2(32)/112/,ERROR_2(3
     *3)/111/,ERROR_2(34)/114/,ERROR_2(35)/116/,ERROR_2(36)/32/,ERROR_2(
     *37)/84/,ERROR_2(38)/89/,ERROR_2(39)/80/,ERROR_2(40)/69/,ERROR_2(41
     *)/32/,ERROR_2(42)/39/,ERROR_2(43)/45/,ERROR_2(44)/49/,ERROR_2(45)/
     *39/,ERROR_2(46)/0/
      DATA ERROR_3(1)/87/,ERROR_3(2)/45/,ERROR_3(3)/74/,ERROR_3(4)/70/,E
     *RROR_3(5)/78/,ERROR_3(6)/82/,ERROR_3(7)/84/,ERROR_3(8)/78/,ERROR_3
     *(9)/83/,ERROR_3(10)/44/,ERROR_3(11)/32/,ERROR_3(12)/32/,ERROR_3(13
     *)/70/,ERROR_3(14)/71/,ERROR_3(15)/84/,ERROR_3(16)/74/,ERROR_3(17)/
     *70/,ERROR_3(18)/78/,ERROR_3(19)/32/,ERROR_3(20)/111/,ERROR_3(21)/1
     *12/,ERROR_3(22)/101/,ERROR_3(23)/110/,ERROR_3(24)/32/,ERROR_3(25)/
     *101/,ERROR_3(26)/114/,ERROR_3(27)/114/,ERROR_3(28)/111/,ERROR_3(29
     *)/114/,ERROR_3(30)/32/,ERROR_3(31)/33/,ERROR_3(32)/0/
      IF(.NOT.(ITYPE.EQ. 0.OR.ITYPE.EQ. 1))GOTO 23000
      K =2
      GOTO 23001
23000 CONTINUE
      IF(.NOT.(ITYPE.EQ. 2.OR.ITYPE.EQ. 3))GOTO 23002
      K =1
      GOTO 23003
23002 CONTINUE
      IERROR =NOT(%LOC(ERROR_2))
	return 1
23003 CONTINUE
23001 CONTINUE
      JFN =0
      IF(.NOT.(ITYPE.EQ. 1.OR.ITYPE.EQ. 3))GOTO 23004
      CALL TTY_GNAME(WORK)
      GOTO 23005
23004 CONTINUE
      CALL SCOPY(SOURCE,1,WORK,1)
23005 CONTINUE
      JFN =OPEN_(WORK,K)
      IF(.NOT.(JFN.EQ.-3))GOTO 23006
      IERROR =NOT(%LOC(ERROR_3))
	return 1
23006 CONTINUE
      CALL SETCHTYPE(1,JFN)
      IERROR =0
      RETURN
      END
      SUBROUTINE FOPENF (JFN,ITYPE,IERROR,*)
      IMPLICIT NONE
      INTEGER JFN,ITYPE,IERROR
      LOGICAL*1 ERROR_1(58)
      DATA ERROR_1(1)/87/,ERROR_1(2)/45/,ERROR_1(3)/74/,ERROR_1(4)/70/,E
     *RROR_1(5)/78/,ERROR_1(6)/82/,ERROR_1(7)/84/,ERROR_1(8)/78/,ERROR_1
     *(9)/83/,ERROR_1(10)/44/,ERROR_1(11)/32/,ERROR_1(12)/32/,ERROR_1(13
     *)/70/,ERROR_1(14)/79/,ERROR_1(15)/80/,ERROR_1(16)/69/,ERROR_1(17)/
     *78/,ERROR_1(18)/70/,ERROR_1(19)/32/,ERROR_1(20)/100/,ERROR_1(21)/1
     *11/,ERROR_1(22)/101/,ERROR_1(23)/115/,ERROR_1(24)/32/,ERROR_1(25)/
     *110/,ERROR_1(26)/111/,ERROR_1(27)/116/,ERROR_1(28)/32/,ERROR_1(29)
     */115/,ERROR_1(30)/117/,ERROR_1(31)/112/,ERROR_1(32)/112/,ERROR_1(3
     *3)/111/,ERROR_1(34)/114/,ERROR_1(35)/116/,ERROR_1(36)/32/,ERROR_1(
     *37)/111/,ERROR_1(38)/116/,ERROR_1(39)/104/,ERROR_1(40)/101/,ERROR_
     *1(41)/114/,ERROR_1(42)/32/,ERROR_1(43)/116/,ERROR_1(44)/104/,ERROR
     *_1(45)/97/,ERROR_1(46)/110/,ERROR_1(47)/32/,ERROR_1(48)/55/,ERROR_
     *1(49)/45/,ERROR_1(50)/98/,ERROR_1(51)/105/,ERROR_1(52)/116/,ERROR_
     *1(53)/32/,ERROR_1(54)/73/,ERROR_1(55)/47/,ERROR_1(56)/79/,ERROR_1(
     *57)/46/,ERROR_1(58)/0/
      IF(.NOT.(JFN.EQ.5))GOTO 23008
      CONTINUE
23008 CONTINUE
      IF(.NOT.(ITYPE.NE. 5.AND.ITYPE.NE. 6))GOTO 23010
      IERROR =NOT(%LOC(ERROR_1))
	return 1
23010 CONTINUE
      RETURN
      END
      SUBROUTINE FCLOSF (JFN,ITYPE,IERROR,*)
      IMPLICIT NONE
      INTEGER JFN,ITYPE,IERROR
      EXTERNAL CLOSE
      IF(.NOT.(JFN.EQ.5.OR.JFN.EQ.6.OR.JFN.EQ.0))GOTO 23012
      CONTINUE
      GOTO 23013
23012 CONTINUE
      CALL CLOSE(JFN)
23013 CONTINUE
      IERROR=0 *ITYPE
      RETURN
      END
      SUBROUTINE FBIN (JFN,CHAR,IERROR,*)
      IMPLICIT NONE
      INTEGER JFN,IERROR
      LOGICAL*1 CHAR,GETCH
23014 CONTINUE
      IERROR =GETCH (CHAR,JFN)
      IF(.NOT.(CHAR.EQ.0))GOTO 23017
      GOTO 23015
23017 CONTINUE
      IF(.NOT.(IERROR.EQ.-1))GOTO 23019
      CHAR =0
23019 CONTINUE
      GOTO 23016
23015 GOTO 23014
23016 CONTINUE
      RETURN
      END
      SUBROUTINE FBOUT (JFN,CHAR,IERROR,*)
      IMPLICIT NONE
      INTEGER JFN,IERROR
      LOGICAL*1 CHAR
      CALL PUTCH(CHAR,JFN)
      IERROR =0
      RETURN
      END
      SUBROUTINE GET_COMMAND_LINE
      IMPLICIT NONE
      CALL GET_COMMAND_LINE_ARG (1 )
      RETURN
      END
      SUBROUTINE GET_COMMAND_LINE_ARG (N )
      IMPLICIT NONE
      LOGICAL*1 BUF(81)
      INTEGER N,K,GETARG3
      K =GETARG3(N,BUF,20)
      CALL GET_COMMAND_FILE (BUF )
      RETURN
      END
      SUBROUTINE GET_COMMAND_FILE (BUF )
      IMPLICIT NONE
      INTEGER XJFN,XSTAT,XERR,X7READ
      COMMON /CGETCH/ XJFN,XSTAT
      LOGICAL*1 BUF(81)
      IF(.NOT.(BUF(1).NE.0))GOTO 23021
      CALL FGTJFN (XJFN,BUF,2,XERR,*8000)
      X7READ =5
      CALL FOPENF (XJFN,X7READ,XERR,*8000)
      XSTAT ='DSK'
23021 CONTINUE
      RETURN
8000  CALL ECHOH (BUF,100)
      CALL ECHOV (' is an unacceptable file for input!!!')
      CALL ECHOR
      XSTAT ='TTY'
      XJFN =-1
      CALL EXIT
      RETURN
      END
