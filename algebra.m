disp(' ')
disp('WELCOME TO THE LINEAR ALGEBRA PROBLEM SOLVER')
disp('Developed by Sugyan Anand, Pavan Rajkumar and Likith P')
disp(' ')
disp('Choose from the list below and enter the corresponding number at the prompt.')
disp(' ')
disp('1. Find the solutions to a system of linear equations.')
disp('2. Compute the largest eigen value and eigen vector of a matrix.')
disp('3. Determine the inverse transformations for a set of linear equations.')
disp(' ')
selection = input('Enter the corresponding number:');

switch (selection)
         case 1
                disp(' ')
                L = input('Enter the equations in matrix form:');
                disp(' ')
                disp(L)
                A = L;
                [m,n] = size(A);
                L = L(1:m,1:n-1);
                d = det(L);
                if d == 0
                    disp('Equations do not have a solution.')
                    return
                end
                if m~=n-1
                    error('Not a square matrix'); %Square matrix check
                end
                j=1;
                %Attempt to make the matrix diagonally dominant
                   while j<n-1
                      great=abs(A(j,j));
                      f=0;
                      i=j;
                      while i<=m    
                        if abs(A(i,j))>great
                          great=abs(A(i,j));
                          store=i;
                          f=1;
                        end
                      i=i+1;  
                      end
                      p=1;
                      if f==1
                       while p<=n
                         temp=A(store,p);
                         A(store,p)=A(j,p);
                         A(j,p)=temp;
                         p=p+1;
                       end
                      end 
                     j=j+1; 
                   end

                disp('The diagonally dominant matrix is:')
                disp(' ')
                disp(A)
                B=zeros(n-1,1);
                C=ones(n-1,1);
                c=0;
                while B~=C 
                  c=c+1;  
                  C=B;  
                  sum=0;
                  for i=1:m
                   sum=0;
                   for j=1:n-1
                     if i~=j
                       sum=sum+A(i,j)*B(j);
                     else
                        continue;
                     end  
                   end
                   B(i)=(A(i,n)-sum)/A(i,i);
                  end 
                end   
                disp('The values are:')
                disp(' ')
                fprintf(' x = %f \n',B(1,1))
                fprintf(' y = %f \n',B(2,1))
                fprintf(' z = %f \n',B(3,1))
                disp(' ')
                c;
        
       case 2
           
            disp(' ')
            disp('FINDING LARGEST EIGEN VALUE AND EIGEN VECTOR OF A MATRIX')
            disp(' ')
            % Enter Matrix as input
            A = input('Enter a square Matrix: \n');
            disp(' ')
            disp(A)
            % Checking for square matrix
            b = size(A,1);
            c = size(A,2);
            if b~=c
                disp('You have not entered a SQUARE MATRIX!')
                return
            end
            % Setting the initial vector and varaibles
            b = b-1;
            C = zeros(1,b);
            I = [1 C]';
            n = 0;
            % Calculating Eigen Values
            while n<300
                D = I;
                Y = A * I;
                x = max(abs(Y));
                I = Y./x;
                n = n + 1;
            end
            disp('The largest Eigen Value is: ')
            x
            disp('The Corresponding Eigen Vector is: ')
            disp(' ')
            disp(I')
    
    case 3
        disp(' ')
        disp('FINDING THE INVERSE TRANSFORMATION')
        disp(' ')
        A = input('Enter the coeffecients of equation y1 in vector form:');
        B = input('Enter the coeffecients of equation y2 in vector form:');
        C = input('Enter the coeffecients of equation y3 in vector form:');
        X = [A;B;C];
        d = det(X);
        if d ~= 0
            disp('The given transformation is regular.')
            disp(' ')
        else
            disp('The transformation is not regular, cannot compute inverse.')
            return
        end
        Y = inv(X);
        disp('The inverse transformations are:')
        disp(' ')
        fprintf('x1 =  (%d)y1 + (%d)y2 + (%d)y3 \n',Y(1,1),Y(1,2),Y(1,3))
        fprintf('x2 =  (%d)y1 + (%d)y2 + (%d)y3 \n',Y(2,1),Y(2,2),Y(2,3))
        fprintf('x3 =  (%d)y1 + (%d)y2 + (%d)y3 \n',Y(3,1),Y(3,2),Y(3,3))
end


