--  Anade mas tests para comprobar todas las combinaciones de
--  operadores positivos, negativos y el cero.

with Ada.Text_IO;     use Ada.Text_IO;
with Test_Assertions; use Test_Assertions;
with playWithArrays;      use playWithArrays;



procedure test_playwitharrays is

   procedure Test_1 is
      Table1 : T_Table (1 .. 5) := (1, 2, 3, 4, 5);
      Table2 : T_Table (1 .. 5) := (5, 4, 3, 2, 1);

   begin
      Assert_True (play (Table1, Table2) = (1, 4, 3, 2, 5), "Play: Positive vector");
   exception
      when others =>
         null;
   end Test_1;



   procedure Test_2 is
      Msg   : constant String := "PlayArrayResultInverse: Positive vector";
      Table1 : T_Table (1 .. 2) := (1,3);
   begin
      Assert_True (playArrayResultInverse (Table1) = (3,1), Msg);

   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         --entra aqui!!!!!
         Put_Line (Msg & " Failed (exception)");
   end Test_2;



begin
   Put_Line ("********************* Test_playwitharrays");
   Test_1;
   Test_2;

end test_playwitharrays;

