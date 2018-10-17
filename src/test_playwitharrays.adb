--  Anade mas tests para comprobar todas las combinaciones de
--  operadores positivos, negativos y el cero.

with Ada.Text_IO;     use Ada.Text_IO;
with Test_Assertions; use Test_Assertions;
with playWithArrays;      use playWithArrays;



procedure test_playwitharrays is

   procedure Test_play is
      Table1 : T_Table (1 .. 5) := (1, 2, 3, 4, 5);
      Table2 : T_Table (1 .. 5) := (5, 4, 3, 2, 1);

   begin
      Assert_True (play (Table1, Table2) = (1, 4, 3, 2, 5), "Play: Positive vector");
   exception
      when others =>
         null;
   end Test_play;


     procedure Test_playInverse is
      Table1 : T_Table (1 .. 5) := (1, 2, 3, 4, 5);
      Table2 : T_Table (1 .. 5) := (5, 4, 3, 2, 1);
   begin
      Assert_True (playInverse (Table1, Table2) = (5,2,3,4,1), "playInverse: Positive vector");
   exception
      when others =>
         null;
     end Test_playInverse;






   procedure Test_playArrayResultInverse is
      Msg   : constant String := "PlayArrayResultInverse: Positive vector";
      Table1 : T_Table (1 .. 3) := (1, 2, 3);
      Table2 : T_Table (1 .. 3) := (99, 100, 101);
      --T_Table : T_Table;
   begin
      --T_Table :=
      Assert_True (playArrayResultInverse (Table1, Table2) = (3,100,1), Msg);
      --Put_Line ((playArrayResultInverse (Table1, Table2))(1)'Img);

   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_playArrayResultInverse;



begin
   Put_Line ("********************* Test_playwitharrays");
   Test_play;
   Test_playInverse;
   Test_playArrayResultInverse;

end test_playwitharrays;

