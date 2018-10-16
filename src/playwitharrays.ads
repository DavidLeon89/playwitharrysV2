package playWithArrays with SPARK_Mode is
   type T_Table is array (Natural range <>) of Integer;

   function play (Table: T_Table; Table_2: T_Table) return T_Table
     with
       Pre => Table'Length > 0 and Table_2'Length > 0;
   function playInverse (Table: T_Table; Table_2: T_Table) return T_Table
   with
       Pre => Table'Length > 0 and Table_2'Length > 0;
   function playArrayResultInverse (Table: T_Table) return T_Table
   with
       Pre => True;

end playWithArrays;
