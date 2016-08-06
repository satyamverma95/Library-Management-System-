/* Program to access country ,states and capital  from the excel database 

  content :source code( MATLAB ),
       database in excel,
       Books details in text for representation purpose.

  Authour: Satyam verma (1031310411)SRM University*/
fclose('all');
num = xlsread('LIBRARYDATABASE.xls','D1:F28');
 
clc
fprintf(2,'\t\t\t\t\tWELCOME TO SRM LIBRARY\n');
fprintf('\t\t\t\tPLEASE ENTER YOUR CHOICE\n');
fprintf('\t\t\t\t 1 . BORROW BOOKS\n');
fprintf('\t\t\t\t 2 . RETURN BOOKS\n');
fprintf('\t\t\t\t 3 . CHECK CURRENT STATUS\n');
fprintf('\t\t\t\t 4 . CHECK AVIABILITY OF BOOKS\n');
fprintf('\t\t\t\t 5 . EXIT SRM INTREGRATED LIBRARY SYSTEM\n');
X=input('ENTER YOUR CHOICE:');
 
N=int2str(X);
L=isempty(X);
if (X<6) | (L==1) |(N==1)  
    switch X,

    case 1;
 clc
     disp('PLEASE SELECT THE BOOK-(press any button to continue...)');
       pause 
       TheBooksAvilableAreAsFollows= textread('LIBRARYDATABASE.txt', '%s', 'whitespace', '''\b''\n''\r''\t')
       fprintf('press any button to continue... \n')
       pause
      Z=input('\nEnter ID:','s');
      L=isempty(Z);
     
      if L~=1
     
          N=input('\nENTER YOUR NAME:','s'); 
     
      K=isempty(N);
     if (K~=1) 
      S=upper(N);
      fname=strcat(Z,'.txt');
        gid=fopen(fname,'r');
          if gid==-1            %# Open the file

fid = fopen(fname,'w');
       
       A=input('PLEASE ENTER BOOK ID: \n');
      if A<28
          
       Q= num(A, 1)-1;
xlswrite('LIBRARYDATABASE.xls', Q, 'Sheet1', sprintf('D%d',A));
 xlswrite('LIBRARYDATABASE.xls', {data(A,1)}, fname, 'A1');      
       ISSUE_DATE=datestr(now, 'dd-mmm-yyyy') 
              pause
           
              d1 = datenum(ISSUE_DATE);


RETURN_DATE = datestr(d1 + 15)
RETURN_DATE2 = datestr(d1 + 30);
RETURN_DATE3 = datestr(d1 + 45);
             pause
             F=int2str(A);
              if fid ~= -1
fprintf(fid,'NAME:%s\n',S);
fprintf(fid,'THE  BOOK BORROWED IS %s\rBOOK ID:%d\n',textdata{A,2},data(A,1));       %# Print the string
 fprintf(fid,'\nISSUEDATE:%s\n',ISSUE_DATE);
 fprintf(fid,'\nRETURNDATE:%s\n',RETURN_DATE);

 
 fclose(fid) ;                    %# Close the file
                           
               
end
           
         if A==data(A),    
       fprintf('You have borrowed book: %s, AUTHOR/PUBLICATION:%s \n',textdata{A,2},textdata{A,3})
      pause
       
      fprintf('PLEASE RETURN BOOK WITHIN DUE DATE (i.e within 15 days from issue_date) TO AVOID FINE \n')
              
         elseif A~=data(A),
                  fprintf('ID does not exist in database \n')
              else
      fprintf('ID does not exist  \n')
       end;
      else 
          fprintf(2,'ABOVE SHOWN BOOKS ARE ONLY AVILABLE \n')
      end;
else
   msgbox('YOU HAVE ALREADY BORROWED THE BOOK PLEASE RETURN AND COME BACK')     
end;
else 
      fprintf(2,'PLEASE ENTER A VALID NAME\n')   


end;
     else 
          fprintf(2,'PLEASE ENTER A VALID ID\n')
       
      end;
             
      
      case 2;
  
    
    clc
      F=input('\nEnter ID:','s');     
     
     
     P=strcat(F,'.txt');
   sid=fopen(P,'r');
   if (sid ~=-1) 
   sai = xlsread('LIBRARYDATABASE.xls',P,'A1');
     
  IDOFTHEBOOKS = textread('LIBRARYDATABASE.txt', '%s', 'whitespace', '''''\b''\n''\r''\t')
   
  
  R=input('PLEASE ENTER THE ID OE THE BOOK TO BE RETURNED: \n');
if (R==sai(1,1))
  Q= num(R, 1)+1;
xlswrite('LIBRARYDATABASE.xls', Q, 'Sheet1', sprintf('D%d',R));
   
        TODAYS_DATE=datestr(now, 'dd-mmm-yyyy')
                        NumofDays = daysact(RETURN_DATE,TODAYS_DATE);
                        NumofDays2 = daysact(RETURN_DATE2,TODAYS_DATE);
                        NumofDays3 = daysact(RETURN_DATE3,TODAYS_DATE);
                        
    if (NumofDays>0) && (NumofDays<15),
        fprintf('YOU HAVE TO PAY THE FINE OF Rs.%g, AS YOU ARE %g DAYS LATE FROM DUE DATE. \n',1*NumofDays,NumofDays)
    elseif (NumofDays2>0) && (NumofDays2<15)
        fprintf('YOU HAVE TO PAY THE FINE OF Rs.%g, AS YOU ARE %g DAYS LATE FROM DUE DATE. \n',1*15+2*NumofDays2,NumofDays)
        elseif NumofDays3>0
        fprintf('YOU HAVE TO PAY THE FINE OF Rs.%g, AS YOU ARE %g DAYS LATE FROM DUE DATE. \n',1*15+2*15+5*NumofDays3,NumofDays)
    else
        fprintf('YOU HAVE RETURNED THE BOOK ON TIME.THANK YOU  \n')     
    
        fclose(sid);
     delete(P);     
    end;

 else
     fprintf('PLEASE ENTER VALID BOOK ID OF BOOK YOU BORROWED \n')
end;
   else
       fprintf('\nYOU HAVE NOT BORROWED THE BOOK\n')
   end;
case 3;
    clc
        temp=input('\nEnter ID:','s');
    fname=strcat(temp,'.txt');
    zid = fopen(fname,'r');
    if zid ~= -1
        
tline = fgetl(zid);
while ischar(tline)
    disp(tline)
    tline = fgetl(zid);
end 

    else 
        fprintf('YOU HAVE NOT BORROWED ANY BOOK \n')
   
    end;
        case 4
       clc
            C=input('ENTER BOOK ID:');
       if C<28
       fprintf('No. of books avilable for %s are: %d \n',textdata{C,2},num(C, 1))
      
       else  
       fprintf(2,'\nPLEASE ENTER A VALID ID \n')
          
       end;
        case 5
            fprintf('THANK YOU FOR USING SRM INTREGRATED LIBRARY SYSTEM \n')

    
    end;
  else
    fprintf(2,'\nPLEASE ENTER A VALID CHOICE \n')


end;         

          
         



  
 

