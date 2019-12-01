//Rosenbrock Function or Banana Function
function f = funcx(x)
    f = 100*((x(2) - x(1).^2).^2) + (x(1) - 1).^2;;
endfunction
function g = grad(x)
    g = [-400*x(1)*(x(2) - x(1).^2) + 2*(x(1) - 1);200 * (x(2) - x(1).^2)];;
endfunction

xnew=[4;4];
step_sz=.001;
G=0;
prev=.00000001;
counter=0;
d = 1;

  while(d >.000000001)
      xprev=xnew;
      g=grad(xprev);
      G=0.9*G+0.1*g'*g;
      xnew=xprev-((step_sz*g)/(sqrt(G)+prev));
      counter=counter+1;
      d = abs(funcx(xprev)-funcx(xnew));
  end;
  printf("%d\n",counter);
  printf("%2.6f\n",funcx(xnew));
  disp(xnew);
