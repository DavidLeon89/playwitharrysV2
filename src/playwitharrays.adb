with Ada.Text_IO;     use Ada.Text_IO;

package body playWithArrays with SPARK_Mode is

   function play (Table: T_Table; Table_2: T_Table) return T_Table is
      tamVec1 : Natural := Table'Last - Table'First;
      tamVec2 : Natural := Table_2'Last - Table_2'First;
      res : T_Table (0..(Table'Last - Table'First)) := (0 => 0, others => 0);
   begin
      if tamVec1 = tamVec2 then
         for J in res'Range loop
            if J mod 2 = 0 then
               res(J) := Table(J+Table'First);
            else
               res(J) := Table_2(J+Table_2'First);
            end if;
         end loop;
      end if;
         return res;
      end play;

   function playInverse (Table: T_Table; Table_2: T_Table) return T_Table is
   begin
      return play(Table_2,Table);
   end playInverse;

   function playArrayResultInverse (Table: T_Table; Table_2: T_Table) return T_Table is
      res : T_Table := play(Table,Table_2);
      tamRes : Natural := res'Last - res'First;
      def : T_Table (0..(Table'Last - Table'First)) := (others => 0);
      tamDef : Natural := def'Last - def'First;

   begin
      Put_Line(tamRes'img & "joder" & tamDef'img);
      if tamRes = tamDef then
         for J in def'Range loop
            pragma Loop_Invariant (J>=0);
            def(def'Last - J) := res(J);
         end loop;
      end if;
      return def;
   end playArrayResultInverse;

end playWithArrays;
