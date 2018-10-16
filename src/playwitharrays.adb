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

   function playArrayResultInverse (Table: T_Table) return T_Table is
      res : T_Table (Table'Range) := (0 => 0, others => 0);
   begin
      for J in Table'Last .. Table'First loop
         res(J) := Table(J);
      end loop;
      return res;
   end playArrayResultInverse;
end playWithArrays;
