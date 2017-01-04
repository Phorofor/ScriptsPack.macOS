FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
Ignoring App Responses

FROM THE APPLESCRIPT LANGUAGE GUIDE:

application responses: AppleScript waits for a response from each application command before proceeding to the next statement or operation. The response indicates if the command completed successfully, and also returns results and error messages, if there are any. If this attribute is ignored, AppleScript does not wait for responses from application commands before proceeding to the next statement, and ignores any results or error messages that are returned. Results and error messages from AppleScript commands, scripting additions, and expressions are not affected by the application responses attribute.

Copyright � 2001�2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
     � 	 		 
 I g n o r i n g   A p p   R e s p o n s e s 
 
 F R O M   T H E   A P P L E S C R I P T   L A N G U A G E   G U I D E : 
 
 a p p l i c a t i o n   r e s p o n s e s :   A p p l e S c r i p t   w a i t s   f o r   a   r e s p o n s e   f r o m   e a c h   a p p l i c a t i o n   c o m m a n d   b e f o r e   p r o c e e d i n g   t o   t h e   n e x t   s t a t e m e n t   o r   o p e r a t i o n .   T h e   r e s p o n s e   i n d i c a t e s   i f   t h e   c o m m a n d   c o m p l e t e d   s u c c e s s f u l l y ,   a n d   a l s o   r e t u r n s   r e s u l t s   a n d   e r r o r   m e s s a g e s ,   i f   t h e r e   a r e   a n y .   I f   t h i s   a t t r i b u t e   i s   i g n o r e d ,   A p p l e S c r i p t   d o e s   n o t   w a i t   f o r   r e s p o n s e s   f r o m   a p p l i c a t i o n   c o m m a n d s   b e f o r e   p r o c e e d i n g   t o   t h e   n e x t   s t a t e m e n t ,   a n d   i g n o r e s   a n y   r e s u l t s   o r   e r r o r   m e s s a g e s   t h a t   a r e   r e t u r n e d .   R e s u l t s   a n d   e r r o r   m e s s a g e s   f r o m   A p p l e S c r i p t   c o m m a n d s ,   s c r i p t i n g   a d d i t i o n s ,   a n d   e x p r e s s i o n s   a r e   n o t   a f f e c t e d   b y   t h e   a p p l i c a t i o n   r e s p o n s e s   a t t r i b u t e . 
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
 l     ��������  ��  ��        l     ����  r         I    �� ��
�� .sysontocTEXT       shor  m     ���� ��    o      ���� 0 cr CR��  ��        l    ����  r        I   �� ��
�� .sysontocTEXT       shor  m    	���� 
��    o      ���� 0 nl NL��  ��        l     ��������  ��  ��        l   � ����  O    �    O    �     k    � ! !  " # " r     $ % $ m     & & � ' '  - - X X X X % l      (���� ( o      ���� 0 target_string  ��  ��   #  ) * ) l   ��������  ��  ��   *  + , + r    & - . - n    $ / 0 / 1   " $��
�� 
pcnt 0 1    "��
�� 
sele . l      1���� 1 o      ���� 0 selected_text  ��  ��   ,  2 3 2 l  ' '��������  ��  ��   3  4 5 4 Z   ' � 6 7�� 8 6 =  ' * 9 : 9 l  ' ( ;���� ; o   ' (���� 0 selected_text  ��  ��   : m   ( ) < < � = =   7 k   - X > >  ? @ ? r   - 0 A B A l  - . C���� C o   - .���� 0 target_string  ��  ��   B l      D���� D o      ���� 0 selected_text  ��  ��   @  E F E r   1 4 G H G m   1 2 I I � J J   H l      K���� K o      ���� 0 script_text  ��  ��   F  L M L r   5 < N O N b   5 : P Q P b   5 8 R S R l  5 6 T���� T o   5 6���� 0 script_text  ��  ��   S m   6 7 U U � V V < i g n o r i n g   a p p l i c a t i o n   r e s p o n s e s Q o   8 9���� 0 cr CR O l      W���� W o      ���� 0 script_text  ��  ��   M  X Y X r   = H Z [ Z b   = F \ ] \ b   = D ^ _ ^ b   = B ` a ` l  = > b���� b o   = >���� 0 script_text  ��  ��   a 1   > A��
�� 
tab  _ l  B C c���� c o   B C���� 0 selected_text  ��  ��   ] o   D E���� 0 cr CR [ l      d���� d o      ���� 0 script_text  ��  ��   Y  e f e r   I P g h g b   I N i j i l  I J k���� k o   I J���� 0 script_text  ��  ��   j m   J M l l � m m  e n d   i g n o r i n g h l      n���� n o      ���� 0 script_text  ��  ��   f  o�� o r   Q X p q p m   Q T r r � s s , - -   i n s e r t   a c t i o n s   h e r e q l      t���� t o      ���� 0 replacement_string  ��  ��  ��  ��   8 k   [ � u u  v w v r   [ ` x y x m   [ ^ z z � { {   y l      |���� | o      ���� 0 script_text  ��  ��   w  } ~ } r   a j  �  b   a h � � � b   a f � � � l  a b ����� � o   a b���� 0 script_text  ��  ��   � m   b e � � � � � < i g n o r i n g   a p p l i c a t i o n   r e s p o n s e s � o   f g���� 0 cr CR � l      ����� � o      ���� 0 script_text  ��  ��   ~  � � � Z   k � � ��� � � E  k v � � � J   k o � �  � � � o   k l���� 0 cr CR �  ��� � o   l m���� 0 nl NL��   � n   o u � � � 4  p u�� �
�� 
cha  � m   s t������ � o   o p���� 0 selected_text   � r   y � � � � b   y � � � � b   y ~ � � � l  y z ����� � o   y z���� 0 script_text  ��  ��   � 1   z }��
�� 
tab  � l  ~  ����� � o   ~ ���� 0 selected_text  ��  ��   � l      ����� � o      ���� 0 script_text  ��  ��  ��   � r   � � � � � b   � � � � � b   � � � � � b   � � � � � l  � � ����� � o   � ����� 0 script_text  ��  ��   � 1   � ���
�� 
tab  � l  � � ����� � o   � ����� 0 selected_text  ��  ��   � o   � ����� 0 cr CR � l      ����� � o      ���� 0 script_text  ��  ��   �  � � � r   � � � � � b   � � � � � b   � � � � � b   � � � � � l  � � ����� � o   � ����� 0 script_text  ��  ��   � m   � � � � � � �  e n d   i g n o r i n g � o   � ����� 0 target_string   � o   � ����� 0 cr CR � l      ����� � o      ���� 0 script_text  ��  ��   �  ��� � r   � � � � � m   � � � � � � �   � l      ����� � o      ���� 0 replacement_string  ��  ��  ��   5  � � � l  � �����~��  �  �~   �  � � � r   � � � � � o   � ��}�} 0 script_text   � n       � � � 1   � ��|
�| 
pcnt � 1   � ��{
�{ 
sele �  � � � l  � ��z�y�x�z  �y  �x   �  � � � Q   � � � ��w � I  � ��v�u�t
�v .sedschksnull���    obj �u  �t   � R      �s�r�q
�s .ascrerr ****      � ****�r  �q  �w   �  � � � l  � ��p�o�n�p  �o  �n   �  � � � n  � � � � � I   � ��m ��l�m 0 replace_and_select   �  � � � o   � ��k�k 0 target_string   �  ��j � o   � ��i�i 0 replacement_string  �j  �l   �  f   � � �  � � � l  � ��h�g�f�h  �g  �f   �  ��e � Q   � � � ��d � I  � ��c�b�a
�c .sedschksnull���    obj �b  �a   � R      �`�_�^
�` .ascrerr ****      � ****�_  �^  �d  �e     4   �] �
�] 
docu � m    �\�\   m     � ��                                                                                  ToyS   alis    �  Leopard9A409Int            �<H+    H�Script Editor.app                                                �p����        ����  	                AppleScript     �<cr      ��j      H�   �  :Leopard9A409Int:Applications:AppleScript:Script Editor.app  $  S c r i p t   E d i t o r . a p p     L e o p a r d 9 A 4 0 9 I n t  *Applications/AppleScript/Script Editor.app  / ��  ��  ��     � � � l     �[�Z�Y�[  �Z  �Y   �  ��X � i      � � � I      �W ��V�W 0 replace_and_select   �  � � � o      �U�U 0 target_string   �  ��T � o      �S�S 0 replacement_string  �T  �V   � O     F � � � O    E � � � k    D � �  � � � r     � � � l    ��R�Q � 1    �P
�P 
pcnt�R  �Q   � o      �O�O 0 	this_text   �  � � � r     � � � l    ��N�M � I   �L�K �
�L .sysooffslong    ��� null�K   � �J � �
�J 
psof � l    ��I�H � o    �G�G 0 target_string  �I  �H   � �F ��E
�F 
psin � o    �D�D 0 	this_text  �E  �N  �M   � o      �C�C 0 this_offset   �  ��B � Z    D � ��A�@ � >     � � � o    �?�? 0 this_offset   � m    �>�>   � k   # @    r   # 8 7  # 4�=
�= 
cha  o   ( *�<�< 0 this_offset   l  + 3�;�: \   + 3	 [   , 1

 o   , -�9�9 0 this_offset   l  - 0�8�7 n   - 0 1   . 0�6
�6 
leng l  - .�5�4 o   - .�3�3 0 target_string  �5  �4  �8  �7  	 m   1 2�2�2 �;  �:   1   4 7�1
�1 
sele �0 r   9 @ l  9 :�/�. o   9 :�-�- 0 replacement_string  �/  �.   l     �,�+ n       1   = ?�*
�* 
pcnt l  : =�)�( 1   : =�'
�' 
sele�)  �(  �,  �+  �0  �A  �@  �B   � l   �&�% 4   �$
�$ 
docu m    �#�# �&  �%   � m     �                                                                                  ToyS   alis    �  Leopard9A409Int            �<H+    H�Script Editor.app                                                �p����        ����  	                AppleScript     �<cr      ��j      H�   �  :Leopard9A409Int:Applications:AppleScript:Script Editor.app  $  S c r i p t   E d i t o r . a p p     L e o p a r d 9 A 4 0 9 I n t  *Applications/AppleScript/Script Editor.app  / ��  �X       �"�"   �!� �! 0 replace_and_select  
�  .aevtoappnull  �   � **** � ����� 0 replace_and_select  � � �    ��� 0 target_string  � 0 replacement_string  �   ����� 0 target_string  � 0 replacement_string  � 0 	this_text  � 0 this_offset   
���������
� 
docu
� 
pcnt
� 
psof
� 
psin� 
� .sysooffslong    ��� null
� 
cha 
� 
leng
� 
sele� G� C*�k/ ;*�,E�O*��� E�O�j "*[�\[Z�\Z���,k2*�,FO�*�,�,FY hUU �!�
�	"#�
� .aevtoappnull  �   � ****! k     �$$  %%  &&  ��  �
  �	  "  # ����� �� &� ������ < I�� U�� l r�� z ��� � ���������� 
� .sysontocTEXT       shor� 0 cr CR� 
� 0 nl NL
� 
docu�  0 target_string  
�� 
sele
�� 
pcnt�� 0 selected_text  �� 0 script_text  
�� 
tab �� 0 replacement_string  
�� 
cha 
�� .sedschksnull���    obj ��  ��  �� 0 replace_and_select  � ��j E�O�j E�O� �*�k/ ��E�O*�,�,E�O��  0�E�O�E�O��%�%E�O�_ %�%�%E�O�a %E�Oa E` Y Ka E�O�a %�%E�O��lv�a i/ �_ %�%E�Y �_ %�%�%E�O�a %�%�%E�Oa E` O�*�,�,FO 
*j W X  hO)�_ l+ O 
*j W X  hUUascr  ��ޭ