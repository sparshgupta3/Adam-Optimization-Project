function f=funcx(x)
f=100*((x(2) - x(1).^2).^2) + (x(1) - 1).^2;
endfunction

function g=grad(x)
     g=[-400*x(1)*(x(2) - x(1).^2) + 2*(x(1) - 1);200 * (x(2) - x(1).^2)];
endfunction

x = [4;4];
alpha= 0.0001;
ep = 0.00000001;
d=1;
t=0;
while(d > ep)
    g = grad(x)
    xnew = x - alpha* grad(x);
    t=t+1;
    d = abs(funcx(xnew) - funcx(x));
    x = xnew;
end
disp(x);
disp(funcx(x));
disp(t);
 
