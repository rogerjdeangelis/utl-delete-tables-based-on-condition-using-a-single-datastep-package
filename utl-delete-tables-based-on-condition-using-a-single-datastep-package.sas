Delete tables based on condition using a single datastep package                                                                   
                                                                                                                                   
Only keep the pair of tables if both tables both exist otherwise delete the pair                                                   
                                                                                                                                   
Based on a solution by                                                                                                             
                                                                                                                                   
github                                                                                                                             
https://tinyurl.com/wptvn2x                                                                                                        
https://github.com/rogerjdeangelis/utl-delete-tables-based-on-condition-using-a-single-datastep-package                            
                                                                                                                                   
SOAPBOX ON                                                                                                                         
I really do not understand why proogrammers do not experiment with DOSUBL.                                                         
I use call execute inside a DOSUBL.                                                                                                
SOAPBOX OFF                                                                                                                        
                                                                                                                                   
SAS Forum (related to)                                                                                                             
https://communities.sas.com/t5/SAS-Programming/Delete-data-set/m-p/617168                                                          
                                                                                                                                   
Yabwon                                                                                                                             
Bartosz Jablonski                                                                                                                  
yabwon@gmail.com                                                                                                                   
https://communities.sas.com/t5/user/viewprofilepage/user-id/35763                                                                  
                                                                                                                                   
*_                   _                                                                                                             
(_)_ __  _ __  _   _| |_                                                                                                           
| | '_ \| '_ \| | | | __|                                                                                                          
| | | | | |_) | |_| | |_                                                                                                           
|_|_| |_| .__/ \__,_|\__|                                                                                                          
        |_|                                                                                                                        
;                                                                                                                                  
                                                                                                                                   
proc datasets lib=work kill;                                                                                                       
run;quit;                                                                                                                          
                                                                                                                                   
data meta;                                                                                                                         
   input t1$ t2$;                                                                                                                  
cards4;                                                                                                                            
A1 B1                                                                                                                              
A2 B2                                                                                                                              
A3 B3                                                                                                                              
;;;;                                                                                                                               
run;quit;                                                                                                                          
                                                                                                                                   
                                                                                                                                   
data                                                                                                                               
      A1(keep=name)                                                                                                                
   /* B1 does not exist */                                                                                                         
   /* A2 does not exist */                                                                                                         
      B2(keep=name age)                                                                                                            
      A3(keep=name weight)                                                                                                         
      B3(keep=name height)                                                                                                         
 ;                                                                                                                                 
 set sashelp.class(obs=3);                                                                                                         
                                                                                                                                   
run;quit;                                                                                                                          
                                                                                                                                   
CONTENTS OF WORK                                                                                                                   
                                                                                                                                   
          Member                                                                                                                   
 Name     Type   Vars                                                                                                              
                                                                                                                                   
 A1       DATA    1  Delete thes we do not have a pair                                                                             
 B2       DATA    2                                                                                                                
                                                                                                                                   
 A3       DATA    2  Only existing pair                                                                                            
 B3       DATA    2                                                                                                                
                                                                                                                                   
*           _                                                                                                                      
 _ __ _   _| | ___  ___                                                                                                            
| '__| | | | |/ _ \/ __|                                                                                                           
| |  | |_| | |  __/\__ \                                                                                                           
|_|   \__,_|_|\___||___/                                                                                                           
                                                                                                                                   
;                                                                                                                                  
           PAIR 1           PAIR 2                          PAIR 3                                                                 
+--------------------------------------------------------------------------------+                                                 
|| Delete A1 and B1  ||  Delete A2 and B2    ||    Keep both we have a pair     ||                                                 
|| Both do not exist ||  Both do not exist   ||                                 ||                                                 
||                   ||                      ||                |                ||                                                 
||  WORK.A1 | WORK.B1||WORK.A2|    WORK.B2   ||     WORK.A3    |    WORK.B3     ||                                                 
||          |        ||       |              ||                |                ||                                                 
||   NAME   |        ||       |  NAME   AGE  ||   NAME  WEIGHT |   NAME  HEIGHT ||                                                 
||          |        ||       |              ||                |                ||                                                 
||  Joyce   |        ||       | Joyce    11  ||  Joyce   50.5  |  Joyce   51.3  ||                                                 
||  Louise  |        ||       | Louise   12  ||  Louise  77.0  |  Louise  56.3  ||                                                 
||  Alice   |        ||       | Alice    13  ||  Alice   84.0  |  Alice   56.5  ||                                                 
||          |        ||       |              ||                |                ||                                                 
+--------------------------------------------------------------------------------+                                                 
                                                                                                                                   
*            _               _                                                                                                     
  ___  _   _| |_ _ __  _   _| |_                                                                                                   
 / _ \| | | | __| '_ \| | | | __|                                                                                                  
| (_) | |_| | |_| |_) | |_| | |_                                                                                                   
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                  
                |_|                                                                                                                
;                                                                                                                                  
                                                                                                                                   
WORK.LOG total obs=3                                                                                                               
                                                                                                                                   
Obs    T1    T2    RC                 STATUS                                                                                       
                                                                                                                                   
 1     A1    B1     0    proc datasets code GENERATED                                                                              
 2     A2    B2     0    proc datasets code GENERATED                                                                              
 3     A3    B3     0    proc datasets code NOT GENERATED * the only pair *                                                        
                                                                                                                                   
                                                                                                                                   
Proc contents lib=work directory;                                                                                                  
run;quit;                                                                                                                          
                                                                                                                                   
Directory                                                                                                                          
                                                                                                                                   
Libref         WORK                                                                                                                
                                                                                                                                   
                                                                                                                                   
            Member   Obs, Entries                                                                                                  
#  Name     Type      or Indexes   Vars                                                                                            
                                                                                                                                   
1  A3       DATA           3        2                                                                                              
2  B3       DATA           3        2                                                                                              
                                                                                                                                   
                                                                                                                                   
*          _       _   _                                                                                                           
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                                
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                               
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                              
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                              
                                                                                                                                   
;                                                                                                                                  
                                                                                                                                   
* I put the create data here becaue you cannot rerun without recreating the input;                                                 
                                                                                                                                   
optiond                                                                                                                            
proc dataset lib=work kill;                                                                                                        
run;quit;                                                                                                                          
                                                                                                                                   
%symdel t1 t2 cc status / nowarn;                                                                                                  
                                                                                                                                   
data                                                                                                                               
      A1(keep=name)                                                                                                                
   /* B1 does not exist */                                                                                                         
   /* A2 does not exist */                                                                                                         
      B2(keep=name age)                                                                                                            
      A3(keep=name weight)                                                                                                         
      B3(keep=name height)                                                                                                         
 ;                                                                                                                                 
 set sashelp.class(obs=3);                                                                                                         
                                                                                                                                   
run;quit;                                                                                                                          
                                                                                                                                   
                                                                                                                                   
data log;                                                                                                                          
                                                                                                                                   
  set meta;                                                                                                                        
                                                                                                                                   
  call symputx('t1',t1);                                                                                                           
  call symputx('t2',t2);                                                                                                           
                                                                                                                                   
  rc=dosubl('                                                                                                                      
      data _null_;                                                                                                                 
        if exist("&t1","data") * exist("&t2","data")=0 then do;                                                                    
            call symputx("status","proc datasets code GENERATED");                                                                 
            call execute("proc datasets nolist; delete &t1 &t2;run;quit;");                                                        
        end;                                                                                                                       
        else call symputx("status","proc datasets code NOT GENERATED");                                                            
      run;quit;                                                                                                                    
      %let cc=&status;                                                                                                             
  ');                                                                                                                              
                                                                                                                                   
   status=symget("CC");                                                                                                            
                                                                                                                                   
run;quit;                                                                                                                          
                                                                                                                                   
                                                                                                                                   
Proc contents lib=work directory;                                                                                                  
run;quit;                                                                                                                          
                                                                                                                                   
* may want to set options NODSNFERR;                                                                                               
                                                                                                                                   
                                                                                                                                   
                                                                                                                                   
