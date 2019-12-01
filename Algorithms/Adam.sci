//Rosenbrock Function or Banana Function
function f = funcx(x)
    f = 100*((x(2) - x(1).^2).^2) + (x(1) - 1).^2;;
endfunction
function g = grad(x)
    g = [-400*x(1)*(x(2) - x(1).^2) + 2*(x(1) - 1);200 * (x(2) - x(1).^2)];;
endfunction

xnew=[4;4];

beta1=.9;
beta2=.99;
alpha=.01;
t=0;
mprev=0;
vprev=0;
prev=0.0000000001;
counter=0
d = 1;

  while(d >0.000000001)
      counter=counter+1;
      xprev=xnew;
      t=t+1;
      g=grad(xprev);
      mnew=beta1*mprev+(1-beta1)*g;
      vnew=beta2*vprev+(1-beta2)*(g'*g);
      mcorr=mnew/(1-(beta1^t));
      vcorr=vnew/(1-(beta2^t));
      xnew=xprev-alpha*mcorr/(sqrt(vcorr)+prev);
      vprev=vnew;
      mprev=mnew;
      d = abs(funcx(xnew)-funcx(xprev));
  end;
  
  printf("%d\n",counter);
  printf("%2.6f\n",funcx(xprev));
  disp(xprev);
