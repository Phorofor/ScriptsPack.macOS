FasdUAS 1.101.10   ��   ��    k             l      ��  ��   
Text Input - 3 Btns

Copyright � 2001�2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
     � 	 	 
 T e x t   I n p u t   -   3   B t n s 
 
 C o p y r i g h t   �   2 0 0 1  2 0 0 7   A p p l e   I n c . 
 
 Y o u   m a y   i n c o r p o r a t e   t h i s   A p p l e   s a m p l e   c o d e   i n t o   y o u r   p r o g r a m ( s )   w i t h o u t 
 r e s t r i c t i o n .     T h i s   A p p l e   s a m p l e   c o d e   h a s   b e e n   p r o v i d e d   " A S   I S "   a n d   t h e 
 r e s p o n s i b i l i t y   f o r   i t s   o p e r a t i o n   i s   y o u r s .     Y o u   a r e   n o t   p e r m i t t e d   t o 
 r e d i s t r i b u t e   t h i s   A p p l e   s a m p l e   c o d e   a s   " A p p l e   s a m p l e   c o d e "   a f t e r   h a v i n g 
 m a d e   c h a n g e s .     I f   y o u ' r e   g o i n g   t o   r e d i s t r i b u t e   t h e   c o d e ,   w e   r e q u i r e 
 t h a t   y o u   m a k e   i t   c l e a r   t h a t   t h e   c o d e   w a s   d e s c e n d e d   f r o m   A p p l e   s a m p l e 
 c o d e ,   b u t   t h a t   y o u ' v e   m a d e   c h a n g e s . 
   
  
 l     ��������  ��  ��        l     ����  r         m        �   
 X - X - X  l      ����  o      ���� 0 target_string  ��  ��  ��  ��        l    ����  r        m       �      l      ����  o      ���� 0 script_text  ��  ��  ��  ��        l    ����  r         b     ! " ! b     # $ # b     % & % b     ' ( ' l   	 )���� ) o    	���� 0 script_text  ��  ��   ( m   	 
 * * � + +   d i s p l a y   d i a l o g   " & o    ���� 0 target_string   $ m     , , � - - n "   d e f a u l t   a n s w e r   " "   b u t t o n s   { " " , " " , " " }   d e f a u l t   b u t t o n   1 " o    ��
�� 
ret    l      .���� . o      ���� 0 script_text  ��  ��  ��  ��     / 0 / l    1���� 1 r     2 3 2 b     4 5 4 b     6 7 6 l    8���� 8 o    ���� 0 script_text  ��  ��   7 m     9 9 � : : t c o p y   t h e   r e s u l t   a s   l i s t   t o   { t e x t _ r e t u r n e d ,   b u t t o n _ p r e s s e d } 5 o    ��
�� 
ret  3 l      ;���� ; o      ���� 0 script_text  ��  ��  ��  ��   0  < = < l     ��������  ��  ��   =  > ? > l   � @���� @ O    � A B A k     � C C  D E D I    %������
�� .miscactvnull��� ��� null��  ��   E  F G F l  & &��������  ��  ��   G  H�� H O   & � I J I k   - � K K  L M L r   - 4 N O N n   - 2 P Q P 1   0 2��
�� 
pcnt Q 1   - 0��
�� 
sele O l      R���� R o      ���� 0 selected_text  ��  ��   M  S T S l  5 5��������  ��  ��   T  U V U Z   5 Q W X���� W >  5 8 Y Z Y l  5 6 [���� [ o   5 6���� 0 selected_text  ��  ��   Z m   6 7 \ \ � ] ]   X Z  ; M ^ _���� ^ =  ; B ` a ` n  ; @ b c b I   < @�������� 0 display_message  ��  ��   c  f   ; < a m   @ A��
�� boovfals _ L   E I d d m   E H e e � f f  u s e r   c a n c e l l e d��  ��  ��  ��   V  g h g l  R R��������  ��  ��   h  i j i r   R Y k l k l  R S m���� m o   R S���� 0 script_text  ��  ��   l l      n���� n n       o p o 1   V X��
�� 
pcnt p 1   S V��
�� 
sele��  ��   j  q r q l  Z Z��������  ��  ��   r  s t s Q   Z k u v�� u I  ] b������
�� .sedschksnull���    obj ��  ��   v R      ������
�� .ascrerr ****      � ****��  ��  ��   t  w x w l  l l��������  ��  ��   x  y z y n  l u { | { I   m u�� }���� 0 replace_and_select   }  ~  ~ o   m n���� 0 target_string     ��� � m   n q � � � � �  ��  ��   |  f   l m z  � � � l  v v��������  ��  ��   �  ��� � Q   v � � ��� � I  y ~������
�� .sedschksnull���    obj ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��   J l  & * ����� � 4  & *�� �
�� 
docu � m   ( )���� ��  ��  ��   B m    ��
�� misccura��  ��   ?  � � � l     ��������  ��  ��   �  � � � i      � � � I      �������� 0 display_message  ��  ��   � k     = � �  � � � I    �� � �
�� .sysodlogaskr        TEXT � b      � � � b      � � � b      � � � m      � � � � � T T h i s   s c r i p t   w i l l   d e l e t e   t h e   s e l e c t e d   t e x t . � o    ��
�� 
ret  � o    ��
�� 
ret  � m     � � � � � 0 D o   y o u   w a n t   t o   c o n t i n u e ? � �� � �
�� 
btns � J     � �  � � � m    	 � � � � �  H e l p �  � � � m   	 
 � � � � �  C o n t i n u e �  ��� � m   
  � � � � �  S t o p��   � �� � �
�� 
dflt � m    ����  � �� ���
�� 
disp � m    ���� ��   �  � � � r     � � � l    ����� � n     � � � 1    ��
�� 
bhit � l    ���� � 1    �~
�~ 
rslt��  �  ��  ��   � l      ��}�| � o      �{�{ 0 user_choice  �}  �|   �  ��z � Z    = � � � � � =    � � � l    ��y�x � o    �w�w 0 user_choice  �y  �x   � m     � � � � �  H e l p � k   " + � �  � � � n  " ( � � � I   # (�v ��u�v 0 script_help   �  ��t � m   # $ � � � � �  S c r i p t E d i t o r 0 0 1�t  �u   �  f   " # �  ��s � L   ) + � � m   ) *�r
�r boovfals�s   �  � � � =  . 3 � � � l  . / ��q�p � o   . /�o�o 0 user_choice  �q  �p   � m   / 2 � � � � �  S t o p �  ��n � L   6 8 � � m   6 7�m
�m boovfals�n   � L   ; = � � m   ; <�l
�l boovtrue�z   �  � � � l     �k�j�i�k  �j  �i   �  � � � i     � � � I      �h ��g�h 0 script_help   �  ��f � o      �e�e 0 this_anchor  �f  �g   � P     $ ��d � � O    # � � � k   	 " � �  � � � I  	 �c�b�a
�c .miscactvnull��� ��� null�b  �a   �  ��` � Q    " � ��_ � I   �^ � �
�^ .helpsancnull���    obj  � o    �]�] 0 this_anchor   � �\ ��[
�\ 
sstr � m     � � � � � $ S c r i p t   E d i t o r   H e l p�[   � R      �Z�Y�X
�Z .ascrerr ****      � ****�Y  �X  �_  �`   � m     � ��                                                                                  hbwr   alis    �  Leopard9A409Int            �<H+     {Help Viewer.app                                                  _Q�+��        ����  	                CoreServices    �<cr      �,       {   @   ?  ;Leopard9A409Int:System:Library:CoreServices:Help Viewer.app      H e l p   V i e w e r . a p p     L e o p a r d 9 A 4 0 9 I n t  +System/Library/CoreServices/Help Viewer.app   / ��  �d   � �W�V
�W consrmte�V   �  � � � l     �U�T�S�U  �T  �S   �  ��R � i     � � � I      �Q ��P�Q 0 replace_and_select   �  � � � o      �O�O 0 target_string   �  ��N � o      �M�M 0 replacement_string  �N  �P   � O     F � � � O    E � � � k    D � �  � � � r       l   �L�K 1    �J
�J 
pcnt�L  �K   o      �I�I 0 	this_text   �  r     l   �H�G I   �F�E
�F .sysooffslong    ��� null�E   �D	

�D 
psof	 l   �C�B o    �A�A 0 target_string  �C  �B  
 �@�?
�@ 
psin o    �>�> 0 	this_text  �?  �H  �G   o      �=�= 0 this_offset   �< Z    D�;�: >     o    �9�9 0 this_offset   m    �8�8   k   # @  r   # 8 7  # 4�7
�7 
cha  o   ( *�6�6 0 this_offset   l  + 3�5�4 \   + 3 [   , 1 o   , -�3�3 0 this_offset   l  - 0�2�1 n   - 0  1   . 0�0
�0 
leng  l  - .!�/�.! o   - .�-�- 0 target_string  �/  �.  �2  �1   m   1 2�,�, �5  �4   1   4 7�+
�+ 
sele "�*" r   9 @#$# l  9 :%�)�(% o   9 :�'�' 0 replacement_string  �)  �(  $ l     &�&�%& n      '(' 1   = ?�$
�$ 
pcnt( l  : =)�#�") 1   : =�!
�! 
sele�#  �"  �&  �%  �*  �;  �:  �<   � l   *� �* 4   �+
� 
docu+ m    �� �   �   � m     �
� misccura�R       �,-./0�  , ����� 0 display_message  � 0 script_help  � 0 replace_and_select  
� .aevtoappnull  �   � ****- � ���12�� 0 display_message  �  �  1 �� 0 user_choice  2  �� �� � � �������
 � ��	 �
� 
ret 
� 
btns
� 
dflt
� 
disp� 
� .sysodlogaskr        TEXT
� 
rslt
�
 
bhit�	 0 script_help  � >��%�%�%����mv�m�l� 
O��,E�O��  )�k+ OfY �a   fY e. � ���34�� 0 script_help  � �5� 5  �� 0 this_anchor  �  3 �� 0 this_anchor  4  � ���  �������
� .miscactvnull��� ��� null
�  
sstr
�� .helpsancnull���    obj ��  ��  � %g� !� *j O ���l W X  hUV/ �� �����67���� 0 replace_and_select  �� ��8�� 8  ������ 0 target_string  �� 0 replacement_string  ��  6 ���������� 0 target_string  �� 0 replacement_string  �� 0 	this_text  �� 0 this_offset  7 
��������������������
�� misccura
�� 
docu
�� 
pcnt
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� 
cha 
�� 
leng
�� 
sele�� G� C*�k/ ;*�,E�O*��� E�O�j "*[�\[Z�\Z���,k2*�,FO�*�,�,FY hUU0 ��9����:;��
�� .aevtoappnull  �   � ****9 k     �<<  ==  >>  ??  /@@  >����  ��  ��  :  ;  �� �� * ,�� 9������������ \�� e������ ����� 0 target_string  �� 0 script_text  
�� 
ret 
�� misccura
�� .miscactvnull��� ��� null
�� 
docu
�� 
sele
�� 
pcnt�� 0 selected_text  �� 0 display_message  
�� .sedschksnull���    obj ��  ��  �� 0 replace_and_select  �� ��E�O�E�O��%�%�%�%E�O��%�%E�O� j*j 	O*�k/ \*�,�,E�O�� )j+ f  	a Y hY hO�*�,�,FO 
*j W X  hO)�a l+ O 
*j W X  hUUascr  ��ޭ