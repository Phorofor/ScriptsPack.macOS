FasdUAS 1.101.10   ��   ��    k             l     ��  ��    A ; Scripts Pack - Tweak various preference variables in macOS     � 	 	 v   S c r i p t s   P a c k   -   T w e a k   v a r i o u s   p r e f e r e n c e   v a r i a b l e s   i n   m a c O S   
  
 l     ��  ��    / ) <Phorofor, https://github.com/Phorofor/>     �   R   < P h o r o f o r ,   h t t p s : / / g i t h u b . c o m / P h o r o f o r / >      l     ��������  ��  ��        l     ��������  ��  ��        l     ����  r         n         1    ��
�� 
psxp  l     ����  b         b     	    l     ����  I    ��   !
�� .earsffdralis        afdr    f      ! �� "��
�� 
rtyp " m    ��
�� 
TEXT��  ��  ��    m     # # � $ $  :  m   	 
 % % � & &  :��  ��    o      ���� 0 resourcepath ResourcePath��  ��     ' ( ' l    )���� ) r     * + * n     , - , 1    ��
�� 
strq - o    ���� 0 resourcepath ResourcePath + o      ���� 20 resourcereferencequoted ResourceReferenceQuoted��  ��   (  . / . l     ��������  ��  ��   /  0 1 0 l     ��������  ��  ��   1  2 3 2 l     ��������  ��  ��   3  4�� 4 l      �� 5 6��   5��
set crediZ to POSIX path of ((path to me) & "Credits.rtf" as string)set crediZRel to quoted form of crediZ
set pageAb to "1"set about1 to "Release: " & return & "https://github.com/Phorofor/ScriptsPack.macOS"set about1x1 to "--"set about1x2 to "The Scripts Pack was created specifically for restricted users running macOS 10.4 and later. See the Information for more details."display alert "About Scripts Pack for macOS" message about1 & return & return & about1x1 & return & return & about1x2 & return buttons ["GitHub", "Credits", "OK"] cancel button 3 default button 3if the button returned of the result is "Credits" then	try		do shell script "open " & crediZRel	on error		display alert "An Expected Error Occured: File Unavailable!" as warning message "The Credits file was unable to be found. You may have modified the Scripts Pack or you aren't using a genuine copy of it from the original source. Please re-install the Scripts Pack if the problem persists. If that doesn't work, you may have installed a copy of the Scripts Pack that is not genuine."	end tryelse	do shell script "open https://github.com/Phorofor/ScriptsPack.macOS"end if     6 � 7 7	 
 s e t   c r e d i Z   t o   P O S I X   p a t h   o f   ( ( p a t h   t o   m e )   &   " C r e d i t s . r t f "   a s   s t r i n g )  s e t   c r e d i Z R e l   t o   q u o t e d   f o r m   o f   c r e d i Z 
  s e t   p a g e A b   t o   " 1 "    s e t   a b o u t 1   t o   " R e l e a s e :   "   &   r e t u r n   &   " h t t p s : / / g i t h u b . c o m / P h o r o f o r / S c r i p t s P a c k . m a c O S "  s e t   a b o u t 1 x 1   t o   " - - "  s e t   a b o u t 1 x 2   t o   " T h e   S c r i p t s   P a c k   w a s   c r e a t e d   s p e c i f i c a l l y   f o r   r e s t r i c t e d   u s e r s   r u n n i n g   m a c O S   1 0 . 4   a n d   l a t e r .   S e e   t h e   I n f o r m a t i o n   f o r   m o r e   d e t a i l s . "   d i s p l a y   a l e r t   " A b o u t   S c r i p t s   P a c k   f o r   m a c O S "   m e s s a g e   a b o u t 1   &   r e t u r n   &   r e t u r n   &   a b o u t 1 x 1   &   r e t u r n   &   r e t u r n   &   a b o u t 1 x 2   &   r e t u r n   b u t t o n s   [ " G i t H u b " ,   " C r e d i t s " ,   " O K " ]   c a n c e l   b u t t o n   3   d e f a u l t   b u t t o n   3  i f   t h e   b u t t o n   r e t u r n e d   o f   t h e   r e s u l t   i s   " C r e d i t s "   t h e n  	 t r y  	 	 d o   s h e l l   s c r i p t   " o p e n   "   &   c r e d i Z R e l  	 o n   e r r o r  	 	 d i s p l a y   a l e r t   " A n   E x p e c t e d   E r r o r   O c c u r e d :   F i l e   U n a v a i l a b l e ! "   a s   w a r n i n g   m e s s a g e   " T h e   C r e d i t s   f i l e   w a s   u n a b l e   t o   b e   f o u n d .   Y o u   m a y   h a v e   m o d i f i e d   t h e   S c r i p t s   P a c k   o r   y o u   a r e n ' t   u s i n g   a   g e n u i n e   c o p y   o f   i t   f r o m   t h e   o r i g i n a l   s o u r c e .   P l e a s e   r e - i n s t a l l   t h e   S c r i p t s   P a c k   i f   t h e   p r o b l e m   p e r s i s t s .   I f   t h a t   d o e s n ' t   w o r k ,   y o u   m a y   h a v e   i n s t a l l e d   a   c o p y   o f   t h e   S c r i p t s   P a c k   t h a t   i s   n o t   g e n u i n e . "  	 e n d   t r y  e l s e  	 d o   s h e l l   s c r i p t   " o p e n   h t t p s : / / g i t h u b . c o m / P h o r o f o r / S c r i p t s P a c k . m a c O S "  e n d   i f  ��       �� 8 9��   8 ��
�� .aevtoappnull  �   � **** 9 �� :���� ; <��
�� .aevtoappnull  �   � **** : k      = =   > >  '����  ��  ��   ;   < 	������ # %��������
�� 
rtyp
�� 
TEXT
�� .earsffdralis        afdr
�� 
psxp�� 0 resourcepath ResourcePath
�� 
strq�� 20 resourcereferencequoted ResourceReferenceQuoted�� )��l �%�%�,E�O��,E�ascr  ��ޭ