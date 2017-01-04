FasdUAS 1.101.10   ��   ��    k             l     ��  ��    A ; Scripts Pack - Tweak various preference variables in macOS     � 	 	 v   S c r i p t s   P a c k   -   T w e a k   v a r i o u s   p r e f e r e n c e   v a r i a b l e s   i n   m a c O S   
  
 l     ��  ��    / ) <Phorofor, https://github.com/Phorofor/>     �   R   < P h o r o f o r ,   h t t p s : / / g i t h u b . c o m / P h o r o f o r / >      l     ��������  ��  ��        l      ��  ��   
display alert "View Information?" message "You can view the main information resources from the Scripts Pack and other information you might need to know or incase you've deleted the original disk image." buttons ["Cancel", "Open"] cancel button 1 default button 2     �    d i s p l a y   a l e r t   " V i e w   I n f o r m a t i o n ? "   m e s s a g e   " Y o u   c a n   v i e w   t h e   m a i n   i n f o r m a t i o n   r e s o u r c e s   f r o m   t h e   S c r i p t s   P a c k   a n d   o t h e r   i n f o r m a t i o n   y o u   m i g h t   n e e d   t o   k n o w   o r   i n c a s e   y o u ' v e   d e l e t e d   t h e   o r i g i n a l   d i s k   i m a g e . "   b u t t o n s   [ " C a n c e l " ,   " O p e n " ]   c a n c e l   b u t t o n   1   d e f a u l t   b u t t o n   2       l     ��������  ��  ��        l     ����  r         l    	 ����  b     	    l      ����   c      ! " ! l     #���� # I    �� $��
�� .earsffdralis        afdr $  f     ��  ��  ��   " m    ��
�� 
ctxt��  ��    m     % % � & &  I n f o r m a t i o n��  ��    o      ���� 0 s1  ��  ��     ' ( ' l    )���� ) r     * + * n     , - , 1    ��
�� 
psxp - o    ���� 0 s1   + o      ���� 0 s1  ��  ��   (  . / . l    0���� 0 r     1 2 1 n     3 4 3 1    ��
�� 
strq 4 o    ���� 0 s1   2 o      ���� 	0 open1  ��  ��   /  5 6 5 l   / 7���� 7 Q    / 8 9�� 8 k    & : :  ; < ; r      = > = b     ? @ ? m     A A � B B 
 o p e n   @ o    ���� 	0 open1   > o      ���� 	0 info1   <  C�� C I  ! &�� D��
�� .sysoexecTEXT���     TEXT D o   ! "���� 	0 info1  ��  ��   9 R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��   6  E F E l     ��������  ��  ��   F  G�� G l      �� H I��   H[U set pValue to (choose from list ["Manual Removal.rtf", "Change Log.rtf", "General Public Licence.rtf"] with prompt "Choose the file you wish to view." with title "View Information File") as stringif pValue is equal to ["Manual Removal.rtf"] then	set p23 to "Manual Removal.rtf"end ifif pValue is equal to ["Change Log"] then	set p23 to "Change Log.rtf"end ifif pValue is equal to ["General Public Licence"] then	set p23 to "GPL"end ifset upD to POSIX path of ((path to me) & "Information:" & pValue)set upDR to quoted form of upD as stringset s3 to do shell script "open " & upDRend     I � J J�   s e t   p V a l u e   t o   ( c h o o s e   f r o m   l i s t   [ " M a n u a l   R e m o v a l . r t f " ,   " C h a n g e   L o g . r t f " ,   " G e n e r a l   P u b l i c   L i c e n c e . r t f " ]   w i t h   p r o m p t   " C h o o s e   t h e   f i l e   y o u   w i s h   t o   v i e w . "   w i t h   t i t l e   " V i e w   I n f o r m a t i o n   F i l e " )   a s   s t r i n g  i f   p V a l u e   i s   e q u a l   t o   [ " M a n u a l   R e m o v a l . r t f " ]   t h e n  	 s e t   p 2 3   t o   " M a n u a l   R e m o v a l . r t f "  e n d   i f  i f   p V a l u e   i s   e q u a l   t o   [ " C h a n g e   L o g " ]   t h e n  	 s e t   p 2 3   t o   " C h a n g e   L o g . r t f "  e n d   i f  i f   p V a l u e   i s   e q u a l   t o   [ " G e n e r a l   P u b l i c   L i c e n c e " ]   t h e n  	 s e t   p 2 3   t o   " G P L "  e n d   i f  s e t   u p D   t o   P O S I X   p a t h   o f   ( ( p a t h   t o   m e )   &   " I n f o r m a t i o n : "   &   p V a l u e )  s e t   u p D R   t o   q u o t e d   f o r m   o f   u p D   a s   s t r i n g  s e t   s 3   t o   d o   s h e l l   s c r i p t   " o p e n   "   &   u p D R  e n d  ��       �� K L��   K ��
�� .aevtoappnull  �   � **** L �� M���� N O��
�� .aevtoappnull  �   � **** M k     / P P   Q Q  ' R R  . S S  5����  ��  ��   N   O ���� %�������� A��������
�� .earsffdralis        afdr
�� 
ctxt�� 0 s1  
�� 
psxp
�� 
strq�� 	0 open1  �� 	0 info1  
�� .sysoexecTEXT���     TEXT��  ��  �� 0)j  �&�%E�O��,E�O��,E�O ��%E�O�j 	W X 
 hascr  ��ޭ