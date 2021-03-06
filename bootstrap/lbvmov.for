      SUBROUTINE VMOVLL (RADIAN,HEMS,DEST,LEN2)
      IMPLICIT NONE
      REAL*4 RADIAN,XBDEG,XBMIN
      INTEGER I,K,LEN2,IDEG,IMIN
      LOGICAL*1 CHAR,ICHAR
      CHARACTER *(*) DEST
      CHARACTER HEMS*2
      XBDEG =ABS(RADIAN*(180./3.14159265))
      IDEG =INT(XBDEG)
      XBMIN =60. *(XBDEG -FLOAT(IDEG))
      IMIN =INT(XBMIN +.5)
      IF(.NOT.(IMIN.GE.60))GOTO 23000
      IDEG =IDEG +1
      IMIN =0
23000 CONTINUE
      IF(.NOT.(RADIAN.GE.0.0))GOTO 23002
      I =1
      GOTO 23003
23002 CONTINUE
      I =2
23003 CONTINUE
      CHAR =ICHAR(HEMS(I:I))
      IF(.NOT.(CHAR.EQ.78.OR.CHAR.EQ.83))GOTO 23004
      K =2
      GOTO 23005
23004 CONTINUE
      K =3
23005 CONTINUE
      CALL VMOVIB (IDEG,K,DEST,LEN2)
      CALL VMOV (45,DEST,LEN2)
      CALL VMOVIZ (IMIN,2,DEST,LEN2)
      CALL VMOV(CHAR,DEST,LEN2)
      RETURN
      END
      SUBROUTINE VMOVLLS (RADIAN,HEMS,DEST,LEN2)
      IMPLICIT NONE
      REAL*4 RADIAN,XBDEG,XBMIN,XBSEC,RSEC
      INTEGER I,K,LEN2,IDEG,IMIN,ISEC,TEES
      LOGICAL*1 CHAR,ICHAR
      CHARACTER *(*) DEST
      CHARACTER HEMS*2
      TEES =0
23006 CONTINUE
      GOTO 23008
      ENTRY VMOVLLST (RADIAN,HEMS,DEST,LEN2)
      TEES =1
23007 GOTO 23006
23008 CONTINUE
      XBDEG =ABS(RADIAN*(180./3.14159265))
      IDEG =INT(XBDEG)
      XBMIN =60. *(XBDEG -FLOAT(IDEG))
      IMIN =INT(XBMIN)
      XBSEC =60. *(XBMIN -FLOAT(IMIN))
      IF(.NOT.(TEES.EQ.1))GOTO 23009
      RSEC =XBSEC +0.05
      GOTO 23010
23009 CONTINUE
      RSEC =INT(XBSEC +0.5)
23010 CONTINUE
      ISEC =RSEC
      IF(.NOT.(RSEC.GE.60.0))GOTO 23011
      IMIN =IMIN +1
      RSEC =RSEC -60.0
      ISEC =0
23011 CONTINUE
      IF(.NOT.(IMIN.GE.60))GOTO 23013
      IDEG =IDEG +1
      IMIN =0
23013 CONTINUE
      IF(.NOT.(RADIAN.GE.0.0))GOTO 23015
      I =1
      GOTO 23016
23015 CONTINUE
      I =2
23016 CONTINUE
      CHAR =ICHAR(HEMS(I:I))
      IF(.NOT.(CHAR.EQ.78.OR.CHAR.EQ.83))GOTO 23017
      K =2
      GOTO 23018
23017 CONTINUE
      K =3
23018 CONTINUE
      CALL VMOVIB (IDEG,K,DEST,LEN2)
      CALL VMOV (45,DEST,LEN2)
      CALL VMOVIZ (IMIN,2,DEST,LEN2)
      CALL VMOV (45,DEST,LEN2)
      IF(.NOT.(TEES.EQ.1))GOTO 23019
      CALL VMOVFZ (RSEC,401,DEST,LEN2)
      GOTO 23020
23019 CONTINUE
      CALL VMOVIZ (ISEC,2,DEST,LEN2)
23020 CONTINUE
      CALL VMOV(CHAR,DEST,LEN2)
      RETURN
      END
      SUBROUTINE VMOVV (VAXCHAR,DEST,LEN2)
      IMPLICIT NONE
      INTEGER LEN_IN,LEN_OUT,I,LEN,LEN2
      CHARACTER *(*) VAXCHAR,DEST
      LOGICAL*1 A_CHAR
      LEN_IN =LEN(VAXCHAR)
      LEN_OUT =LEN(DEST)
      I=1
23021 IF(.NOT.(I.LE.LEN_IN))GOTO 23023
      A_CHAR =ICHAR (VAXCHAR(I:I) )
      IF(.NOT.(A_CHAR.EQ.0))GOTO 23024
      GOTO 23023
23024 CONTINUE
      IF(.NOT.(LEN2.GE.LEN_OUT))GOTO 23026
      GOTO 23023
23026 CONTINUE
      LEN2 =LEN2 +1
      DEST(LEN2:LEN2) =VAXCHAR(I:I)
23022 I=I+1
      GOTO 23021
23023 CONTINUE
      END
      SUBROUTINE VMOVVN (VAXCHAR,DEST,LEN2)
      IMPLICIT NONE
      INTEGER I,ILEN,LEN2,LEN
      CHARACTER *(*) VAXCHAR,DEST
      LOGICAL*1 A_CHAR
      ILEN =LEN(VAXCHAR)
      I=1
23028 IF(.NOT.(I.LE.ILEN))GOTO 23030
      A_CHAR =ICHAR (VAXCHAR(I:I) )
      IF(.NOT.(A_CHAR.EQ.32.OR.A_CHAR.EQ.0))GOTO 23031
      GOTO 23030
23031 CONTINUE
      CALL VMOV (A_CHAR,DEST,LEN2 )
23029 I=I+1
      GOTO 23028
23030 CONTINUE
      END
      SUBROUTINE VMOVH (HSTRNG,LEN,DEST,LEN2)
      IMPLICIT NONE
      INTEGER I,LEN,LEN2
      CHARACTER *(*) DEST
      LOGICAL*1 HSTRNG(100)
      I=1
23033 IF(.NOT.(I.LE.LEN))GOTO 23035
      IF(.NOT.(HSTRNG(I).EQ.0))GOTO 23036
      GOTO 23035
23036 CONTINUE
      CALL VMOV(HSTRNG(I),DEST,LEN2)
23034 I=I+1
      GOTO 23033
23035 CONTINUE
      RETURN
      END
      SUBROUTINE VMOVHN (HSTRNG,LEN,DEST,LEN2)
      IMPLICIT NONE
      INTEGER I,LEN,LEN2
      CHARACTER *(*) DEST
      LOGICAL*1 HSTRNG(100)
      I=1
23038 IF(.NOT.(I.LE.LEN))GOTO 23040
      IF(.NOT.(HSTRNG(I).EQ.32.OR.HSTRNG(I).EQ.0))GOTO 23041
      GOTO 23040
23041 CONTINUE
      CALL VMOV(HSTRNG(I),DEST,LEN2)
23039 I=I+1
      GOTO 23038
23040 CONTINUE
      RETURN
      END
      SUBROUTINE VMOVI(I,DEST,LEN2)
      IMPLICIT NONE
      INTEGER I,J,K,LEN2
      LOGICAL*1 STRNG(21)
      CHARACTER *(*) DEST
      STRNG(21) =0
      K =IABS(I)
      J =20
23043 IF(.NOT.(J.GT.0))GOTO 23045
      STRNG(J) =MOD(K,10) +48
      K =K/10
23044 J=J-1
      GOTO 23043
23045 CONTINUE
      J=1
23046 IF(.NOT.(J.LT.20))GOTO 23048
      IF(.NOT.(STRNG(J).NE.48))GOTO 23049
      GOTO 23048
23049 CONTINUE
23047 J=J+1
      GOTO 23046
23048 CONTINUE
      IF(.NOT.(I.LT.0))GOTO 23051
      CALL VMOV (45,DEST,LEN2)
23051 CONTINUE
      CALL VMOVST(STRNG(J),DEST,LEN2)
      RETURN
      END
      SUBROUTINE VMOVIZ(I,N,DEST,LEN2)
      IMPLICIT NONE
      INTEGER I,J,K,N,LEN2
      CHARACTER *(*) DEST
      LOGICAL*1 STRNG(11),IFILL,ISIGN
      IFILL =48
      GO TO 100
      ENTRY VMOVIB(I,N,DEST,LEN2)
      IFILL =32
100   STRNG(11) =0
      K =IABS(I)
      J =1
23053 IF(.NOT.(J.LE.10))GOTO 23055
      STRNG(J) =MOD(K,10) +48
      K =K/10
23054 J=J+1
      GOTO 23053
23055 CONTINUE
      J=10
23056 IF(.NOT.(J.GT.1))GOTO 23058
      IF(.NOT.(STRNG(J).NE.48))GOTO 23059
      GOTO 23058
23059 CONTINUE
23057 J=J-1
      GOTO 23056
23058 CONTINUE
      IF(.NOT.(I.LT.0))GOTO 23061
      ISIGN =45
      GOTO 23062
23061 CONTINUE
      ISIGN =IFILL
23062 CONTINUE
      K=N
23063 IF(.NOT.(K.GE.1))GOTO 23065
      IF(.NOT.(IFILL.EQ.48.AND.ISIGN.EQ.45))GOTO 23066
      CALL VMOV(ISIGN,DEST,LEN2)
      ISIGN =IFILL
      GOTO 23064
23066 CONTINUE
      IF(.NOT.(K-1.EQ.J))GOTO 23068
      CALL VMOV(ISIGN,DEST,LEN2)
      GOTO 23069
23068 CONTINUE
      IF(.NOT.(K.GT.J))GOTO 23070
      CALL VMOV(IFILL,DEST,LEN2)
      GOTO 23071
23070 CONTINUE
      CALL VMOV(STRNG(K),DEST,LEN2)
23071 CONTINUE
23069 CONTINUE
23064 K=K-1
      GOTO 23063
23065 CONTINUE
      RETURN
      END
      SUBROUTINE VMOVLN(STRNG,DEST,LEN2)
      IMPLICIT NONE
      INTEGER LEN2
      LOGICAL*1 STRNG(100)
      CHARACTER *(*) DEST
      CALL VMOVST(STRNG,DEST,LEN2)
      CALL VMOVR (DEST,LEN2)
      RETURN
      END
      SUBROUTINE VMOVR (DEST,LEN2)
      IMPLICIT NONE
      INTEGER LEN2
      CHARACTER *(*) DEST
      CALL VMOV(13,DEST,LEN2)
      CALL VMOV(10,DEST,LEN2)
      RETURN
      END
      SUBROUTINE VMOVST(STRNG,DEST,LEN2)
      IMPLICIT NONE
      INTEGER I,LEN2
      CHARACTER *(*) DEST
      LOGICAL*1 STRNG(100)
      I=1
23072 IF(.NOT.(STRNG(I).NE.0))GOTO 23074
      CALL VMOV(STRNG(I),DEST,LEN2)
23073 I=I+1
      GOTO 23072
23074 CONTINUE
      RETURN
      END
      SUBROUTINE VMOV(I,DEST,LEN2)
      IMPLICIT NONE
      INTEGER*4 LEN_OUT,LEN2
      CHARACTER *(*) DEST
      LOGICAL*1 I
      INTEGER IL
      LEN_OUT =LEN(DEST)
      IF(.NOT.(LEN2.LT.LEN_OUT))GOTO 23075
      LEN2 =LEN2 +1
      IL =I
      DEST(LEN2:LEN2) =CHAR(IL)
23075 CONTINUE
      RETURN
      END
      SUBROUTINE VMOVO (IVAL,ILEN,DEST,LEN2)
      IMPLICIT NONE
      CHARACTER *(*) DEST
      INTEGER*4 IVAL,ILEN,LEN2,I,J,K
      I =IVAL
      K=(ILEN-1)*3
23077 IF(.NOT.(K.GE.0))GOTO 23079
      J =IAND(ISHFT(I,-(K)),'0007'X)
      CALL VMOV (J+48,DEST,LEN2)
23078 K=K-3
      GOTO 23077
23079 CONTINUE
      RETURN
      END
      SUBROUTINE VMOVX (IVAL,ILEN,DEST,LEN2)
      IMPLICIT NONE
      CHARACTER *(*) DEST
      INTEGER*4 IVAL,ILEN,LEN2,I,J,K
      I =IVAL
      K=(ILEN-1)*4
23080 IF(.NOT.(K.GE.0))GOTO 23082
      J =IAND(ISHFT(I,-(K)),'000F'X)
      IF(.NOT.(J.LE.9))GOTO 23083
      CALL VMOV (J+48,DEST,LEN2)
      GOTO 23084
23083 CONTINUE
      CALL VMOV (65-10+J,DEST,LEN2)
23084 CONTINUE
23081 K=K-4
      GOTO 23080
23082 CONTINUE
      RETURN
      END
      SUBROUTINE VMOVF (TVAL,IDEC,DEST,LEN2)
      IMPLICIT NONE
      REAL*4 FVAL,TVAL,R,RVAL
      INTEGER*4 IDEC,LEN2,EX,I,LEN,NDEC,IVAL,LEN_W,LEN_F
      CHARACTER *(*) DEST,FILL*1
      FILL =''
23085 CONTINUE
      GOTO 23087
      ENTRY VMOVFZ (TVAL,IDEC,DEST,LEN2)
      FILL ='0'
23086 GOTO 23085
23087 CONTINUE
      FVAL =TVAL
      EX =0
23088 IF(.NOT.(FVAL.GT.4.0E9))GOTO 23089
      FVAL =FVAL / 1000.0
      EX =EX +3
      GOTO 23088
23089 CONTINUE
      LEN =IDEC/100
      NDEC =MOD(IDEC,100)
      R =(.5 / 10 **NDEC)
      RVAL =SIGN(ABS(FVAL) +R,FVAL)
      IVAL =RVAL
      LEN_W =LEN -NDEC -1
      LEN_F =NDEC
      IF(.NOT.(EX.NE.0.AND.LEN_W.GT.3))GOTO 23090
      LEN_W =LEN_W -3
23090 CONTINUE
      LEN =LEN_W
      IF(.NOT.(LEN.LE.0))GOTO 23092
      IF(.NOT.(IVAL.EQ.0.AND.RVAL.LT.0))GOTO 23094
      CALL VMOVV ('-0',DEST,LEN2)
      GOTO 23095
23094 CONTINUE
      CALL VMOVI (IVAL,DEST,LEN2)
23095 CONTINUE
      GOTO 23093
23092 CONTINUE
      IF(.NOT.(IVAL.EQ.0.AND.RVAL.LT.0))GOTO 23096
23098 IF(.NOT.(LEN.GT.2))GOTO 23099
      CALL VMOVV (FILL,DEST,LEN2)
      LEN=LEN-1
      GOTO 23098
23099 CONTINUE
      CALL VMOVV ('-0',DEST,LEN2)
      GOTO 23097
23096 CONTINUE
      IF(.NOT.(FILL.EQ.''))GOTO 23100
      CALL VMOVIB (IVAL,LEN,DEST,LEN2)
      GOTO 23101
23100 CONTINUE
      CALL VMOVIZ (IVAL,LEN,DEST,LEN2)
23101 CONTINUE
23097 CONTINUE
23093 CONTINUE
      CALL VMOV (46,DEST,LEN2)
      R =RVAL -IVAL
      I =ABS(R) *10 **NDEC
      CALL VMOVIZ (I,NDEC,DEST,LEN2)
      IF(.NOT.(EX.NE.0))GOTO 23102
      CALL VMOVV ('e',DEST,LEN2)
      CALL VMOVIZ (EX,2,DEST,LEN2)
23102 CONTINUE
      RETURN
      END
      SUBROUTINE VMOVVT (VAXCHAR,DEST,LEN2)
      IMPLICIT NONE
      INTEGER LAST_NB
      INTEGER I,LEN_IN,LEN_OUT,LEN2,LEN
      CHARACTER *(*) VAXCHAR,DEST
      LEN_IN =LEN(VAXCHAR)
      LEN_OUT =LEN(DEST)
      LAST_NB =LEN2
      I=1
23104 IF(.NOT.(I.LE.LEN_IN))GOTO 23106
      IF(.NOT.(VAXCHAR(I:I).EQ.CHAR(0)))GOTO 23107
      GOTO 23106
23107 CONTINUE
      IF(.NOT.(LEN2.GE.LEN_OUT))GOTO 23109
      GOTO 23106
23109 CONTINUE
      LEN2 =LEN2 +1
      DEST(LEN2:LEN2) =VAXCHAR(I:I)
      IF(.NOT.(VAXCHAR(I:I).NE.''))GOTO 23111
      LAST_NB =LEN2
23111 CONTINUE
23105 I=I+1
      GOTO 23104
23106 CONTINUE
      LEN2 =LAST_NB
      RETURN
      END
      SUBROUTINE VMOV_FREQ (FREQ,DP,DEST,LEN2)
      IMPLICIT NONE
      REAL FREQ,FREQ_2
      INTEGER*4 DP
      INTEGER LEN2
      CHARACTER *(*) DEST
      CHARACTER *4 FREQ_U
      FREQ_2 =FREQ
      FREQ_U ='MHz'
      IF(.NOT.(FREQ_2.LT.3.0))GOTO 23113
      FREQ_2 =FREQ_2 *1000.0
      FREQ_U ='kHz'
      GOTO 23114
23113 CONTINUE
      IF(.NOT.(FREQ_2.GE.3000.0))GOTO 23115
      FREQ_2 =FREQ_2 / 1000.0
      FREQ_U ='GHz'
23115 CONTINUE
23114 CONTINUE
      CALL VMOVF (FREQ_2,DP,DEST,LEN2)
      CALL VMOVV (FREQ_U,DEST,LEN2)
      END
