FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l     �� 	 
��   	    AppDelegate.applescript    
 �   2     A p p D e l e g a t e . a p p l e s c r i p t      l     ��  ��       LL App Update Tool     �   (     L L   A p p   U p d a t e   T o o l      l     ��������  ��  ��        l     ��  ��    9 3  Created by Houle, Todd - 1170 - MITLL on 11/6/15.     �   f     C r e a t e d   b y   H o u l e ,   T o d d   -   1 1 7 0   -   M I T L L   o n   1 1 / 6 / 1 5 .      l     ��  ��    2 ,  Copyright � 2015 MIT. All rights reserved.     �   X     C o p y r i g h t   �   2 0 1 5   M I T .   A l l   r i g h t s   r e s e r v e d .      l     ��������  ��  ��         l     ��������  ��  ��      ! " ! h     �� #�� 0 appdelegate AppDelegate # k       $ $  % & % j     �� '
�� 
pare ' 4     �� (
�� 
pcls ( m     ) ) � * *  N S O b j e c t &  + , + l     ��������  ��  ��   ,  - . - l     �� / 0��   /  
 IBOutlets    0 � 1 1    I B O u t l e t s .  2 3 2 j   	 �� 4�� 0 	thewindow 	theWindow 4 m   	 
��
�� 
msng 3  5 6 5 j    �� 7�� 0 
atableview 
aTableView 7 m    ��
�� 
msng 6  8 9 8 j    �� :�� (0 thearraycontroller theArrayController : m    ��
�� 
msng 9  ; < ; j    �� =�� 0 thedata theData = m    ��
�� 
msng <  > ? > j    �� @�� 0 
statustext 
statusText @ m     A A � B B   ?  C D C l     ��������  ��  ��   D  E F E i     G H G I      �� I���� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_ I  J�� J o      ���� 0 anotification aNotification��  ��   H k      K K  L M L l     �� N O��   N R L Insert code here to initialize your application before any files are opened    O � P P �   I n s e r t   c o d e   h e r e   t o   i n i t i a l i z e   y o u r   a p p l i c a t i o n   b e f o r e   a n y   f i l e s   a r e   o p e n e d M  Q�� Q I     �������� 0 refreshtime_ refreshTime_��  ��  ��   F  R S R l     ��������  ��  ��   S  T U T i     V W V I      �� X���� :0 applicationshouldterminate_ applicationShouldTerminate_ X  Y�� Y o      ���� 
0 sender  ��  ��   W k      Z Z  [ \ [ l     �� ] ^��   ] M G Insert code here to do any housekeeping before your application quits     ^ � _ _ �   I n s e r t   c o d e   h e r e   t o   d o   a n y   h o u s e k e e p i n g   b e f o r e   y o u r   a p p l i c a t i o n   q u i t s   \  `�� ` L      a a n     b c b o    ����  0 nsterminatenow NSTerminateNow c m     ��
�� misccura��   U  d e d l     ��������  ��  ��   e  f g f i     # h i h I      �� j���� 0 	quittime_ 	quitTime_ j  k�� k o      ���� 
0 sender  ��  ��   i O    
 l m l I   	������
�� .aevtquitnull��� ��� null��  ��   m  f      g  n o n l     ��������  ��  ��   o  p q p i   $ ' r s r I      �������� 0 refreshtime_ refreshTime_��  ��   s l    � t u v t k     � w w  x y x I    �� z��
�� .ascrcmnt****      � **** z m      { { � | | J R e f r e s h i n g   l i s t   o f   u p d a t e s   t o   d i s p l a y��   y  } ~ } Q      ���  I  	 �� ���
�� .sysoexecTEXT���     TEXT � m   	 
 � � � � � ^ r m   / u s r / l o c a l / u p d a t e T o o l / u p d a t e T o o l T o u c h F i l e s / *��   � R      ������
�� .ascrerr ****      � ****��  ��  ��   ~  � � � r     � � � J    ����   � o      ���� 0 listofupdates listOfUpdates �  � � � r      � � � m     � � � � � J / u s r / l o c a l / u p d a t e T o o l / u p d a t e r I n f o . t x t � o      ���� 0 theupdatefile theUpdateFile �  � � � Q   ! ~ � ��� � k   $ u � �  � � � r   $ + � � � I  $ )�� ���
�� .rdwropenshor       file � o   $ %���� 0 theupdatefile theUpdateFile��   � o      ���� 0 
filehandle 
fileHandle �  � � � r   , 5 � � � n   , 3 � � � 2  1 3��
�� 
cpar � l  , 1 ����� � I  , 1�� ���
�� .rdwrread****        **** � o   , -���� 0 
filehandle 
fileHandle��  ��  ��   � o      ���� 0 updates Updates �  ��� � X   6 u ��� � � Z   F p � ����� � ?  F K � � � n   F I � � � 1   G I��
�� 
leng � o   F G���� 0 nextline nextLine � m   I J���� 
 � k   N l � �  � � � r   N U � � � I  N S�� ���
�� .sysodsct****        scpt � o   N O���� 0 nextline nextLine��   � o      ���� 0 myrecord myRecord �  � � � s   V Z � � � o   V W���� 0 myrecord myRecord � l      ����� � n       � � �  ;   X Y � o   W X���� 0 listofupdates listOfUpdates��  ��   �  ��� � I  [ l�� ���
�� .ascrcmnt****      � **** � b   [ h � � � b   [ d � � � m   [ ^ � � � � �  A d d i n g   � l  ^ c ����� � n   ^ c � � � o   _ c���� 0 appname appName � o   ^ _���� 0 myrecord myRecord��  ��   � m   d g � � � � �     t o   i n s t a l l   L i s t��  ��  ��  ��  �� 0 nextline nextLine � o   9 :���� 0 updates Updates��   � R      ������
�� .ascrerr ****      � ****��  ��  ��   �  � � � l   ��������  ��  ��   �  � � � l   ��������  ��  ��   �  � � � l   �� � ���   � H BtheData is the table that shows in the GUI.  Set everything there.    � � � � � t h e D a t a   i s   t h e   t a b l e   t h a t   s h o w s   i n   t h e   G U I .     S e t   e v e r y t h i n g   t h e r e . �  � � � r    � � � � o    ��� 0 listofupdates listOfUpdates � n      � � � o   � ��~�~ 0 thedata theData �  f   � � �  � � � I  � ��} ��|
�} .rdwrclosnull���     **** � o   � ��{�{ 0 
filehandle 
fileHandle�|   �  ��z � r   � � � � � m   � � � � � � �  R e a d y . � n      � � � o   � ��y�y 0 
statustext 
statusText �  f   � ��z   u 1 +load the list of required updates at bootup    v � � � V l o a d   t h e   l i s t   o f   r e q u i r e d   u p d a t e s   a t   b o o t u p q  � � � l     �x�w�v�x  �w  �v   �  � � � l     �u�t�s�u  �t  �s   �  � � � i   ( + � � � I      �r ��q�r 0 reloadapps_ reloadApps_ �  ��p � o      �o�o 
0 sender  �p  �q   � k      � �  � � � I    �n ��m
�n .sysoexecTEXT���     TEXT � l     ��l�k � m      � � � � � � t o u c h   ' / u s r / l o c a l / u p d a t e T o o l / u p d a t e T o o l T o u c h F i l e s / J S S + u p d a t e a p p s 4 + r e b o o t N o '�l  �k  �m   �  � � � I   �j � �
�j .sysodlogaskr        TEXT � m     � � � � � z P l e a s e   r e o p e n   t h i s   a p p l i c a t i o n   o n c e   t h e   r e f r e s h   h a s   f i n i s h e d . � �i � �
�i 
btns � m    	 � � � � �  Q u i t � �h ��g
�h 
dflt � m   
 �f�f �g   �  ��e � O    � � � I   �d�c�b
�d .aevtquitnull��� ��� null�c  �b   �  f    �e   �  � � � l     �a�`�_�a  �`  �_   �  � � � i   , /   I      �^�]�^ 0 updateapps_ updateApps_ �\ o      �[�[ 
0 sender  �\  �]   k      r      m     �Z�Z   o      �Y�Y 0 adoberuncount adobeRunCount 	
	 r     m    �X
�X boovfals o      �W�W 0 rebootok rebootOK
  X    [�V Z    V�U�T l   #�S�R =   # l   !�Q�P c    ! n     o    �O�O 0 appinstallchk appInstallChk o    �N�N 0 	onerecord 	oneRecord m     �M
�M 
bool�Q  �P   m   ! "�L
�L boovtrue�S  �R   Z   & R�K�J l  & -�I�H =  & - l  & + �G�F  c   & +!"! n   & )#$# o   ' )�E�E 
0 reboot  $ o   & '�D�D 0 	onerecord 	oneRecord" m   ) *�C
�C 
bool�G  �F   m   + ,�B
�B boovtrue�I  �H   k   0 N%% &'& r   0 @()( n   0 >*+* 1   < >�A
�A 
bhit+ l  0 <,�@�?, I  0 <�>-.
�> .sysodlogaskr        TEXT- m   0 1// �00 ^ A   r e b o o t   i s   r e q u i r e d   t o   i n s t a l l   t h e s e   u p d a t e s .  . �=12
�= 
btns1 J   2 633 454 m   2 366 �77  C a n c e l5 8�<8 m   3 499 �::  R e b o o t�<  2 �;;�:
�; 
dflt; m   7 8�9�9 �:  �@  �?  ) o      �8�8 0 
the_button  ' <�7< Z   A N=>�6?= =  A D@A@ o   A B�5�5 0 
the_button  A m   B CBB �CC  C a n c e l>  S   G H�6  ? r   K NDED m   K L�4
�4 boovtrueE o      �3�3 0 rebootok rebootOK�7  �K  �J  �U  �T  �V 0 	onerecord 	oneRecord o    �2�2 0 thedata theData FGF l  \ \�1�0�/�1  �0  �/  G HIH Z   \ �JK�.�-J =  \ _LML o   \ ]�,�, 0 rebootok rebootOKM m   ] ^�+
�+ boovfalsK k   b �NN OPO r   b vQRQ n   b tSTS 1   r t�*
�* 
bhitT l  b rU�)�(U I  b r�'VW
�' .sysodlogaskr        TEXTV m   b cXX �YY j A p p l i c a t i o n s   w i l l   b e   c l o s e d   a s   n e c e s s a r y   t o   i n s t a l l .  W �&Z[
�& 
btnsZ J   d l\\ ]^] m   d g__ �``  C a n c e l^ a�%a m   g jbb �cc  C o n t i n u e�%  [ �$d�#
�$ 
dfltd m   m n�"�" �#  �)  �(  R o      �!�! 0 
the_button  P e� e Z   w �fg��f =  w |hih o   w x�� 0 
the_button  i m   x {jj �kk  C a n c e lg  S    ��  �  �   �.  �-  I lml l  � �����  �  �  m non X   � �p�qp Z   � �rs��r l  � �t��t =  � �uvu l  � �w��w c   � �xyx n   � �z{z o   � ��� 0 appinstallchk appInstallChk{ o   � ��� 0 	onerecord 	oneRecordy m   � ��
� 
bool�  �  v m   � ��
� boovtrue�  �  s Z   � �|}�~| l  � ��� =  � ���� l  � ����
� c   � ���� n   � ���� o   � ��	�	 
0 reboot  � o   � ��� 0 	onerecord 	oneRecord� m   � ��
� 
bool�  �
  � m   � ��
� boovtrue�  �  } I  � ����
� .sysoexecTEXT���     TEXT� l  � ����� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� d t o u c h   ' / u s r / l o c a l / u p d a t e T o o l / u p d a t e T o o l T o u c h F i l e s /� n   � ���� o   � ��� 
0 source  � o   � �� �  0 	onerecord 	oneRecord� m   � ��� ���  +� n   � ���� o   � ����� 0 	jsspolicy 	jssPolicy� o   � ����� 0 	onerecord 	oneRecord� m   � ��� ���  + r e b o o t Y e s '�  �  �  �  ~ I  � ������
�� .sysoexecTEXT���     TEXT� l  � ������� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� d t o u c h   ' / u s r / l o c a l / u p d a t e T o o l / u p d a t e T o o l T o u c h F i l e s /� n   � ���� o   � ����� 
0 source  � o   � ����� 0 	onerecord 	oneRecord� m   � ��� ���  +� n   � ���� o   � ����� 0 	jsspolicy 	jssPolicy� o   � ����� 0 	onerecord 	oneRecord� m   � ��� ���  + r e b o o t N o '��  ��  ��  �  �  � 0 	onerecord 	oneRecordq o   � ����� 0 thedata theDatao ��� l  � ���������  ��  ��  � ��� r   � ���� m   � ��� ��� , U p d a t e s   i n   P r o g r e s s . . .� n     ��� o   � ����� 0 
statustext 
statusText�  f   � �� ��� l  � ���������  ��  ��  � ���� O  ���� I ������
�� .aevtquitnull��� ��� null��  ��  �  f   � ���   � ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��   " ���� l     ��������  ��  ��  ��       ������  � ���� 0 appdelegate AppDelegate� �� #���� 0 appdelegate AppDelegate� �� �����
�� misccura
�� 
pcls� ���  N S O b j e c t� ������������� A��������  � ������������������������
�� 
pare�� 0 	thewindow 	theWindow�� 0 
atableview 
aTableView�� (0 thearraycontroller theArrayController�� 0 thedata theData�� 0 
statustext 
statusText�� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_�� :0 applicationshouldterminate_ applicationShouldTerminate_�� 0 	quittime_ 	quitTime_�� 0 refreshtime_ refreshTime_�� 0 reloadapps_ reloadApps_�� 0 updateapps_ updateApps_��  
�� 
msng
�� 
msng
�� 
msng
�� 
msng� �� H���������� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_�� ����� �  ���� 0 anotification aNotification��  � ���� 0 anotification aNotification� ���� 0 refreshtime_ refreshTime_�� *j+  � �� W���������� :0 applicationshouldterminate_ applicationShouldTerminate_�� ����� �  ���� 
0 sender  ��  � ���� 
0 sender  � ����
�� misccura��  0 nsterminatenow NSTerminateNow�� ��,E� �� i���������� 0 	quittime_ 	quitTime_�� ����� �  ���� 
0 sender  ��  � ���� 
0 sender  � ��
�� .aevtquitnull��� ��� null�� ) *j  U� �� s���������� 0 refreshtime_ refreshTime_��  ��  � �������������� 0 listofupdates listOfUpdates�� 0 theupdatefile theUpdateFile�� 0 
filehandle 
fileHandle�� 0 updates Updates�� 0 nextline nextLine�� 0 myrecord myRecord�  {�� ������� ������������������� ��� ����� ���
�� .ascrcmnt****      � ****
�� .sysoexecTEXT���     TEXT��  ��  
�� .rdwropenshor       file
�� .rdwrread****        ****
�� 
cpar
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
leng�� 

�� .sysodsct****        scpt�� 0 appname appName�� 0 thedata theData
�� .rdwrclosnull���     ****�� 0 
statustext 
statusText�� ��j O 
�j W X  hOjvE�O�E�O V�j E�O�j �-E�O >�[��l kh ��,� #�j E�O��6GOa �a ,%a %j Y h[OY��W X  hO�)a ,FO�j Oa )a ,F� �� ����������� 0 reloadapps_ reloadApps_�� ����� �  ���� 
0 sender  ��  � ���� 
0 sender  � 	 ��� ��� ���������
�� .sysoexecTEXT���     TEXT
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT
�� .aevtquitnull��� ��� null�� �j O����k� O) *j U� ������������ 0 updateapps_ updateApps_�� ����� �  ���� 
0 sender  ��  � ����~�}�|�� 
0 sender  � 0 adoberuncount adobeRunCount�~ 0 rebootok rebootOK�} 0 	onerecord 	oneRecord�| 0 
the_button  � �{�z�y�x�w�v/�u69�t�s�r�qBX_bj��p��o��n�����m�l
�{ 
kocl
�z 
cobj
�y .corecnte****       ****�x 0 appinstallchk appInstallChk
�w 
bool�v 
0 reboot  
�u 
btns
�t 
dflt�s 
�r .sysodlogaskr        TEXT
�q 
bhit�p 
0 source  �o 0 	jsspolicy 	jssPolicy
�n .sysoexecTEXT���     TEXT�m 0 
statustext 
statusText
�l .aevtquitnull��� ��� null��	jE�OfE�O Rb  [��l kh ��,�&e  1��,�&e  #����lv�l� �,E�O��  Y eE�Y hY h[OY��O�f  '��a a lv�l� �,E�O�a   Y hY hO ib  [��l kh ��,�&e  H��,�&e   a �a ,%a %�a ,%a %j Y a �a ,%a %�a ,%a %j Y h[OY��Oa )a ,FO) *j Uascr  ��ޭ