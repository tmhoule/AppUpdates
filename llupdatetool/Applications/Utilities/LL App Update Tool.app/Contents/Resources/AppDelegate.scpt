FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l     �� 	 
��   	    AppDelegate.applescript    
 �   2     A p p D e l e g a t e . a p p l e s c r i p t      l     ��  ��       LL App Update Tool     �   (     L L   A p p   U p d a t e   T o o l      l     ��������  ��  ��        l     ��  ��    9 3  Created by Houle, Todd - 1170 - MITLL on 11/6/15.     �   f     C r e a t e d   b y   H o u l e ,   T o d d   -   1 1 7 0   -   M I T L L   o n   1 1 / 6 / 1 5 .      l     ��  ��    ? 9  Copyright � 2015 MIT Lincoln Labs. All rights reserved.     �   r     C o p y r i g h t   �   2 0 1 5   M I T   L i n c o l n   L a b s .   A l l   r i g h t s   r e s e r v e d .      l     ��������  ��  ��         l     ��������  ��  ��      !�� ! h     �� "�� 0 appdelegate AppDelegate " k       # #  $ % $ j     �� &
�� 
pare & 4     �� '
�� 
pcls ' m     ( ( � ) )  N S O b j e c t %  * + * l     ��������  ��  ��   +  , - , l     �� . /��   .  
 IBOutlets    / � 0 0    I B O u t l e t s -  1 2 1 j   	 �� 3�� 0 	thewindow 	theWindow 3 m   	 
��
�� 
msng 2  4 5 4 j    �� 6�� 0 
atableview 
aTableView 6 m    ��
�� 
msng 5  7 8 7 j    �� 9�� (0 thearraycontroller theArrayController 9 m    ��
�� 
msng 8  : ; : j    �� <�� 0 thedata theData < m    ��
�� 
msng ;  = > = j    �� ?�� 0 
statustext 
statusText ? m     @ @ � A A   >  B C B l     ��������  ��  ��   C  D E D i     F G F I      �� H���� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_ H  I�� I o      ���� 0 anotification aNotification��  ��   G k      J J  K L K l     �� M N��   M R L Insert code here to initialize your application before any files are opened    N � O O �   I n s e r t   c o d e   h e r e   t o   i n i t i a l i z e   y o u r   a p p l i c a t i o n   b e f o r e   a n y   f i l e s   a r e   o p e n e d L  P�� P I     �������� 0 refreshtime_ refreshTime_��  ��  ��   E  Q R Q l     ��������  ��  ��   R  S T S i     U V U I      �� W���� :0 applicationshouldterminate_ applicationShouldTerminate_ W  X�� X o      ���� 
0 sender  ��  ��   V k      Y Y  Z [ Z l     �� \ ]��   \ M G Insert code here to do any housekeeping before your application quits     ] � ^ ^ �   I n s e r t   c o d e   h e r e   t o   d o   a n y   h o u s e k e e p i n g   b e f o r e   y o u r   a p p l i c a t i o n   q u i t s   [  _�� _ L      ` ` n     a b a o    ����  0 nsterminatenow NSTerminateNow b m     ��
�� misccura��   T  c d c l     ��������  ��  ��   d  e f e i     # g h g I      �� i���� 0 	quittime_ 	quitTime_ i  j�� j o      ���� 
0 sender  ��  ��   h O    
 k l k I   	������
�� .aevtquitnull��� ��� null��  ��   l  f      f  m n m l     ��������  ��  ��   n  o p o i   $ ' q r q I      �������� 0 refreshtime_ refreshTime_��  ��   r l    � s t u s k     � v v  w x w I    �� y��
�� .ascrcmnt****      � **** y m      z z � { { J R e f r e s h i n g   l i s t   o f   u p d a t e s   t o   d i s p l a y��   x  | } | Q     ~ �� ~ I  	 �� ���
�� .sysoexecTEXT���     TEXT � m   	 
 � � � � � j r m   / u s r / l o c a l / M I T L L / u p d a t e T o o l / u p d a t e T o o l T o u c h F i l e s / *��    R      ������
�� .ascrerr ****      � ****��  ��  ��   }  � � � r     � � � J    ����   � o      ���� 0 listofupdates listOfUpdates �  � � � r      � � � m     � � � � � V / u s r / l o c a l / M I T L L / u p d a t e T o o l / u p d a t e r I n f o . t x t � o      ���� 0 theupdatefile theUpdateFile �  � � � Q   ! ~ � ��� � k   $ u � �  � � � r   $ + � � � I  $ )�� ���
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
�� .ascrerr ****      � ****��  ��  ��   �  � � � l   ��������  ��  ��   �  � � � l    �� � ���   �      try
        --find out if Adobe CC updates needed
            set AdobeCCNeeded to (do shell script "defaults read /Library/Preferences/edu.mit.ll.isd.plist adobeUpdateAvail")
            if (AdobeCCNeeded as string is "1")
                set adobeRecord to run script "{source:\"Adobe\",appName:\"Adobe Creative Cloud\",appVersion:\"---\",jssPolicy:\"AdobeCC\",dueDate:\"---\",appInstallChk:true,reboot:false}"
                copy adobeRecord to the end of listOfUpdates
            end if
        end try
       � � � �             t r y 
                 - - f i n d   o u t   i f   A d o b e   C C   u p d a t e s   n e e d e d 
                         s e t   A d o b e C C N e e d e d   t o   ( d o   s h e l l   s c r i p t   " d e f a u l t s   r e a d   / L i b r a r y / P r e f e r e n c e s / e d u . m i t . l l . i s d . p l i s t   a d o b e U p d a t e A v a i l " ) 
                         i f   ( A d o b e C C N e e d e d   a s   s t r i n g   i s   " 1 " ) 
                                 s e t   a d o b e R e c o r d   t o   r u n   s c r i p t   " { s o u r c e : \ " A d o b e \ " , a p p N a m e : \ " A d o b e   C r e a t i v e   C l o u d \ " , a p p V e r s i o n : \ " - - - \ " , j s s P o l i c y : \ " A d o b e C C \ " , d u e D a t e : \ " - - - \ " , a p p I n s t a l l C h k : t r u e , r e b o o t : f a l s e } " 
                                 c o p y   a d o b e R e c o r d   t o   t h e   e n d   o f   l i s t O f U p d a t e s 
                         e n d   i f 
                 e n d   t r y 
       �  � � � l   �������  ��  �   �  � � � l   �~ � ��~   � H BtheData is the table that shows in the GUI.  Set everything there.    � � � � � t h e D a t a   i s   t h e   t a b l e   t h a t   s h o w s   i n   t h e   G U I .     S e t   e v e r y t h i n g   t h e r e . �  � � � r    � � � � o    ��}�} 0 listofupdates listOfUpdates � n      � � � o   � ��|�| 0 thedata theData �  f   � � �  � � � I  � ��{ ��z
�{ .rdwrclosnull���     **** � o   � ��y�y 0 
filehandle 
fileHandle�z   �  ��x � r   � � � � � m   � � � � � � �  R e a d y . � n      � � � o   � ��w�w 0 
statustext 
statusText �  f   � ��x   t 1 +load the list of required updates at bootup    u � � � V l o a d   t h e   l i s t   o f   r e q u i r e d   u p d a t e s   a t   b o o t u p p  � � � l     �v�u�t�v  �u  �t   �  � � � l     �s�r�q�s  �r  �q   �  � � � i   ( + � � � I      �p ��o�p 0 reloadapps_ reloadApps_ �  ��n � o      �m�m 
0 sender  �n  �o   � k      � �  � � � I    �l ��k
�l .sysoexecTEXT���     TEXT � l     ��j�i � m      � � � � � � t o u c h   ' / u s r / l o c a l / M I T L L / u p d a t e T o o l / u p d a t e T o o l T o u c h F i l e s / J S S + u p d a t e a p p s 4 + r e b o o t N o '�j  �i  �k   �  � � � I   �h � �
�h .sysodlogaskr        TEXT � m     � � � � � z P l e a s e   r e o p e n   t h i s   a p p l i c a t i o n   o n c e   t h e   r e f r e s h   h a s   f i n i s h e d . � �g � �
�g 
btns � m    	 � � � � �  Q u i t � �f ��e
�f 
dflt � m   
 �d�d �e   �  � � � O    �  � I   �c�b�a
�c .aevtquitnull��� ��� null�b  �a     f     � �` l    �_�_   d ^ do shell script "/bin/sleep 49"
        refreshTime_()
        set my statusText to "Ready."     � �   d o   s h e l l   s c r i p t   " / b i n / s l e e p   4 9 " 
                 r e f r e s h T i m e _ ( ) 
                 s e t   m y   s t a t u s T e x t   t o   " R e a d y . "  �`   �  l     �^�]�\�^  �]  �\    i   , /	
	 I      �[�Z�[ 0 updateapps_ updateApps_ �Y o      �X�X 
0 sender  �Y  �Z  
 k      r      m     �W�W   o      �V�V 0 adoberuncount adobeRunCount  r     m    �U
�U boovfals o      �T�T 0 rebootok rebootOK  X    [�S Z    V�R�Q l   #�P�O =   # l   !�N�M c    ! !  n    "#" o    �L�L 0 appinstallchk appInstallChk# o    �K�K 0 	onerecord 	oneRecord! m     �J
�J 
bool�N  �M   m   ! "�I
�I boovtrue�P  �O   Z   & R$%�H�G$ l  & -&�F�E& =  & -'(' l  & +)�D�C) c   & +*+* n   & ),-, o   ' )�B�B 
0 reboot  - o   & '�A�A 0 	onerecord 	oneRecord+ m   ) *�@
�@ 
bool�D  �C  ( m   + ,�?
�? boovtrue�F  �E  % k   0 N.. /0/ r   0 @121 n   0 >343 1   < >�>
�> 
bhit4 l  0 <5�=�<5 I  0 <�;67
�; .sysodlogaskr        TEXT6 m   0 188 �99 ^ A   r e b o o t   i s   r e q u i r e d   t o   i n s t a l l   t h e s e   u p d a t e s .  7 �::;
�: 
btns: J   2 6<< =>= m   2 3?? �@@  C a n c e l> A�9A m   3 4BB �CC  R e b o o t�9  ; �8D�7
�8 
dfltD m   7 8�6�6 �7  �=  �<  2 o      �5�5 0 
the_button  0 E�4E Z   A NFG�3HF =  A DIJI o   A B�2�2 0 
the_button  J m   B CKK �LL  C a n c e lG  S   G H�3  H r   K NMNM m   K L�1
�1 boovtrueN o      �0�0 0 rebootok rebootOK�4  �H  �G  �R  �Q  �S 0 	onerecord 	oneRecord o    �/�/ 0 thedata theData OPO l  \ \�.�-�,�.  �-  �,  P QRQ Z   \ �ST�+�*S =  \ _UVU o   \ ]�)�) 0 rebootok rebootOKV m   ] ^�(
�( boovfalsT k   b �WW XYX r   b vZ[Z n   b t\]\ 1   r t�'
�' 
bhit] l  b r^�&�%^ I  b r�$_`
�$ .sysodlogaskr        TEXT_ m   b caa �bb j A p p l i c a t i o n s   w i l l   b e   c l o s e d   a s   n e c e s s a r y   t o   i n s t a l l .  ` �#cd
�# 
btnsc J   d lee fgf m   d ghh �ii  C a n c e lg j�"j m   g jkk �ll  C o n t i n u e�"  d �!m� 
�! 
dfltm m   m n�� �   �&  �%  [ o      �� 0 
the_button  Y n�n Z   w �op��o =  w |qrq o   w x�� 0 
the_button  r m   x {ss �tt  C a n c e lp  S    ��  �  �  �+  �*  R uvu l  � �����  �  �  v wxw X   � �y�zy Z   � �{|��{ l  � �}��} =  � �~~ l  � ����� c   � ���� n   � ���� o   � ��� 0 appinstallchk appInstallChk� o   � ��� 0 	onerecord 	oneRecord� m   � ��
� 
bool�  �   m   � ��
� boovtrue�  �  | Z   � ������ l  � ���
�	� =  � ���� l  � ����� c   � ���� n   � ���� o   � ��� 
0 reboot  � o   � ��� 0 	onerecord 	oneRecord� m   � ��
� 
bool�  �  � m   � ��
� boovtrue�
  �	  � I  � ����
� .sysoexecTEXT���     TEXT� l  � ��� ��� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� p t o u c h   ' / u s r / l o c a l / M I T L L / u p d a t e T o o l / u p d a t e T o o l T o u c h F i l e s /� n   � ���� o   � ����� 
0 source  � o   � ����� 0 	onerecord 	oneRecord� m   � ��� ���  +� n   � ���� o   � ����� 0 	jsspolicy 	jssPolicy� o   � ����� 0 	onerecord 	oneRecord� m   � ��� ���  + r e b o o t Y e s '�   ��  �  �  � I  � ������
�� .sysoexecTEXT���     TEXT� l  � ������� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� p t o u c h   ' / u s r / l o c a l / M I T L L / u p d a t e T o o l / u p d a t e T o o l T o u c h F i l e s /� n   � ���� o   � ����� 
0 source  � o   � ����� 0 	onerecord 	oneRecord� m   � ��� ���  +� n   � ���� o   � ����� 0 	jsspolicy 	jssPolicy� o   � ����� 0 	onerecord 	oneRecord� m   � ��� ���  + r e b o o t N o '��  ��  ��  �  �  � 0 	onerecord 	oneRecordz o   � ����� 0 thedata theDatax ��� l  � ���������  ��  ��  � ��� r   � ���� m   � ��� ��� , U p d a t e s   i n   P r o g r e s s . . .� n     ��� o   � ����� 0 
statustext 
statusText�  f   � �� ��� l  � ���������  ��  ��  � ���� O  ���� I ������
�� .aevtquitnull��� ��� null��  ��  �  f   � ���   ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��  ��       ������  � ���� 0 appdelegate AppDelegate� �� "���� 0 appdelegate AppDelegate� �� �����
�� misccura
�� 
pcls� ���  N S O b j e c t� ������������� @��������  � ������������������������
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
msng� �� G���������� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_�� ����� �  ���� 0 anotification aNotification��  � ���� 0 anotification aNotification� ���� 0 refreshtime_ refreshTime_�� *j+  � �� V���������� :0 applicationshouldterminate_ applicationShouldTerminate_�� ����� �  ���� 
0 sender  ��  � ���� 
0 sender  � ����
�� misccura��  0 nsterminatenow NSTerminateNow�� ��,E� �� h���������� 0 	quittime_ 	quitTime_�� ����� �  ���� 
0 sender  ��  � ���� 
0 sender  � ��
�� .aevtquitnull��� ��� null�� ) *j  U� �� r���������� 0 refreshtime_ refreshTime_��  ��  � �������������� 0 listofupdates listOfUpdates�� 0 theupdatefile theUpdateFile�� 0 
filehandle 
fileHandle�� 0 updates Updates�� 0 nextline nextLine�� 0 myrecord myRecord�  z�� ������� ������������������� ��� ����� ���
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
�� .aevtquitnull��� ��� null�� �j O����k� O) *j UOP� ��
���������� 0 updateapps_ updateApps_�� ����� �  ���� 
0 sender  ��  � ������~�}�� 
0 sender  �� 0 adoberuncount adobeRunCount� 0 rebootok rebootOK�~ 0 	onerecord 	oneRecord�} 0 
the_button  � �|�{�z�y�x�w8�v?B�u�t�s�rKahks��q��p��o�����n�m
�| 
kocl
�{ 
cobj
�z .corecnte****       ****�y 0 appinstallchk appInstallChk
�x 
bool�w 
0 reboot  
�v 
btns
�u 
dflt�t 
�s .sysodlogaskr        TEXT
�r 
bhit�q 
0 source  �p 0 	jsspolicy 	jssPolicy
�o .sysoexecTEXT���     TEXT�n 0 
statustext 
statusText
�m .aevtquitnull��� ��� null��	jE�OfE�O Rb  [��l kh ��,�&e  1��,�&e  #����lv�l� �,E�O��  Y eE�Y hY h[OY��O�f  '��a a lv�l� �,E�O�a   Y hY hO ib  [��l kh ��,�&e  H��,�&e   a �a ,%a %�a ,%a %j Y a �a ,%a %�a ,%a %j Y h[OY��Oa )a ,FO) *j U ascr  ��ޭ