with Ada.Text_IO;     use Ada.Text_IO;

package body playWithArrays with SPARK_Mode => On is

   function play (Table: T_Table; Table_2: T_Table) return T_Table is
      res : T_Table (0..(Table'Last - Table'First)) := (others => 0);
   begin
      if (Table'Length - 1) = (Table_2'Length - 1) then
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
      def : T_Table (0..(Table'Last - Table'First)) := (others => 0);
      begin
      if res'Length = def'Length and res'First = def'First then
         for J in def'Range loop
            pragma Loop_Invariant (J>=0);
            def(def'Last - J) := res(J);
         end loop;
      end if;
      return def;
   end playArrayResultInverse;

end playWithArrays;
